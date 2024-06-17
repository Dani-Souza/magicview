import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magicview/App/shared/auth/validators/email_validator.dart';
import 'package:magicview/App/shared/auth/validators/password_validator.dart';
import 'package:magicview/app_routes.dart';
import 'package:magicview/bloc/login_user_bloc/login_user_bloc.dart';
import 'package:magicview/pages/components/my_text.dart';
import 'package:magicview/pages/home_pages/components/my_text_form_field.dart';
import 'package:magicview/pages/home_pages/homepage.dart';

class LoginPage extends StatefulWidget {
  final LoginUserBloc loginUserBloc;
  const LoginPage({super.key, required this.loginUserBloc});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool get _isEmailValid =>
      emailController.text.isNotEmpty && emailController.text.contains("@");
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  final EmailValidator _emailValidator = EmailValidator();
  final PasswordValidator _passwordValidator = PasswordValidator();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<LoginUserBloc, LoginUserStateBloc>(
        bloc: widget.loginUserBloc,
        listener: (context, state) {
          if (state is LoginUserErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: MyText(
                title: state.message,
                fontSize: 14,
              ),
              backgroundColor: Theme.of(context).colorScheme.primary,
              behavior: SnackBarBehavior.floating,
            ));
          }
          if (state is LoginUserLoadingState) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: const MyText(
                title: "Carregando",
                fontSize: 14,
              ),
              backgroundColor: Theme.of(context).colorScheme.primary,
              behavior: SnackBarBehavior.floating,
            ));
          }
        },
        child: SafeArea(
          child: BlocBuilder<LoginUserBloc, LoginUserStateBloc>(
            bloc: widget.loginUserBloc,
            builder: (context, state) {
              if (state is LoginUserSuccessState) {
                return const HomePage();
              }
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  child: Form(
                    key: formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/image/magicview.gif',
                          width: 336,
                          height: 171,
                        ),
                        Image.asset(
                          'assets/image/logo.png',
                          width: 369,
                          height: 85,
                        ),
                        MyTextFormField(
                          validator: (value) {
                            return _emailValidator.Validate(email: value);
                          },
                          textEditingController: emailController,
                          labelText: "E-mail",
                          icon: Icons.email,
                        ),
                        MyTextFormField(
                            validator: (value) {
                              return _passwordValidator.validate(
                                  password: value);
                            },
                            textEditingController: passwordController,
                            labelText: "Senha",
                            obscureText: true,
                            icon: Icons.key),
                        const SizedBox(
                          height: 20,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: ElevatedButton(
                                        key: const Key("button-login"),
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor: Theme.of(context)
                                                .colorScheme
                                                .secondary),
                                        onPressed: () {
                                          if (formKey.currentState!
                                              .validate()) {
                                            if (_isEmailValid &&
                                                passwordController
                                                    .text.isNotEmpty) {
                                              widget.loginUserBloc.add(
                                                  LoginUserEventSubmit(
                                                      email:
                                                          emailController.text,
                                                      password:
                                                          passwordController
                                                              .text));
                                            }
                                          }
                                        },
                                        child: const Text(
                                          'Login',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16),
                                        )),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor: Theme.of(context)
                                                .colorScheme
                                                .secondary),
                                        onPressed: () {
                                          Navigator.pushNamed(
                                              context, AppRoutes.addNewUser);
                                        },
                                        child: const Text(
                                          "CRIAR CONTA",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16),
                                        )),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
