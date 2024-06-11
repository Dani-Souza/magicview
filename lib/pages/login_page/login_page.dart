import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magicview/app_routes.dart';
import 'package:magicview/bloc/login_user_bloc/login_user_bloc.dart';
import 'package:magicview/pages/components/my_text.dart';
import 'package:magicview/pages/home_pages/components/my_text_form_field.dart';
import 'package:magicview/pages/home_pages/homepage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool get _isEmailValid =>
      emailController.text.isNotEmpty && emailController.text.contains("@");
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
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
                      if (value == null ||
                          value.isEmpty ||
                          !value.contains("@")) {
                        return 'Por favor digite seu E-mail';
                      }
                      return null;
                    },
                    textEditingController: emailController,
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
                    child: Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                              key: const Key("button-login"),
                              style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      Theme.of(context).colorScheme.secondary),
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  if (_isEmailValid &&
                                      passwordController.text.isNotEmpty) {}
                                }
                              },
                              child: const Text(
                                'Login',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 16),
                              )),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
