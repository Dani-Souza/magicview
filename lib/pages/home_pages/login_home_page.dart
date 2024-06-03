import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magicview/app_routes.dart';
import 'package:magicview/bloc/login_user_bloc/login_user_bloc.dart';
import 'package:magicview/pages/components/my_text.dart';
import 'package:magicview/pages/home_pages/components/my_text_form_field.dart';
import 'package:magicview/pages/home_pages/homepage.dart';

class LoginHomePage extends StatefulWidget {
  const LoginHomePage({super.key});

  @override
  State<LoginHomePage> createState() => _LoginHomePageState();
}

class _LoginHomePageState extends State<LoginHomePage> {
  final TextEditingController emailEditingController = TextEditingController();
  final TextEditingController passwordEditingController =
      TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff21005D),
      body: SafeArea(
          child: BlocListener<LoginUserBloc, LoginUserStateBloc>(
        listener: (context, state) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: MyText(
              title:
                  state is LoginUserErrorState ? state.message : " Logando ...",
              fontSize: 14,
            ),
            backgroundColor: Theme.of(context).colorScheme.primary,
            behavior: SnackBarBehavior.floating,
          ));
        },
        child: BlocBuilder<LoginUserBloc, LoginUserStateBloc>(
          builder: (context, state) {
            if (state is LoginUserSuccessState) {
              return const HomePage();
            }

            return SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.only(top: 90),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Form(
                    key: _formKey,
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
                            if (value == null || value.isEmpty) {
                              return 'Por favor digite sua E-mail';
                            }
                            return null;
                          },
                          textEditingController: emailEditingController,
                          labelText: "E-mail",
                          icon: Icons.email,
                        ),
                        MyTextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Por favor digite sua senha';
                              }
                              return null;
                            },
                            textEditingController: passwordEditingController,
                            labelText: "Senha",
                            obscureText: true,
                            icon: Icons.key),
                        const SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                context.read<LoginUserBloc>().add(
                                    LoginUserEventSubmit(
                                        email: emailEditingController.text,
                                        password:
                                            passwordEditingController.text));
                              }
                            },
                            child: const Text(
                              "ACESSAR",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 16),
                            )),
                        const SizedBox(
                          height: 50,
                        ),
                        ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, AppRoutes.addNewUser);
                            },
                            child: const Text(
                              "CRIAR CONTA",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 16),
                            )),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      )),

      //<- place where the image appears
    );
  }
}
