import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magicview/bloc/add_new_user/add_new_user_bloc.dart';
import 'package:magicview/pages/home_pages/components/my_text_form_field.dart';
import 'package:magicview/pages/home_pages/initial_home_page.dart';

class AddUserPage extends StatefulWidget {
  const AddUserPage({super.key});

  @override
  State<AddUserPage> createState() => _AddUserPageState();
}

class _AddUserPageState extends State<AddUserPage> {
  final TextEditingController nickEditingController = TextEditingController();
  final TextEditingController emailEditingController = TextEditingController();
  final TextEditingController passwordEditingController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff21005D),
      body: SafeArea(
          child: BlocListener<AddNewUserBloc, AddNewUserStateBloc>(
        listener: (context, state) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(state is AddNewUserErrorState
                  ? state.message
                  : " Cadastrando ...")));
        },
        child: BlocBuilder<AddNewUserBloc, AddNewUserStateBloc>(
          builder: (context, state) {
            if (state is AddNewUserLoadedState) {
              return const InitialHomePage();
            }

            return SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.only(top: 90),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
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
                        textEditingController: nickEditingController,
                        labelText: "Nick",
                        icon: Icons.person_4,
                      ),
                      MyTextFormField(
                        textEditingController: emailEditingController,
                        labelText: "E-mail",
                        icon: Icons.email,
                      ),
                      MyTextFormField(
                          textEditingController: passwordEditingController,
                          labelText: "Senha",
                          obscureText: true,
                          icon: Icons.key),
                      const SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            context.read<AddNewUserBloc>().add(
                                AddNewUserSubmitEvent(
                                    nick: nickEditingController.text,
                                    email: emailEditingController.text,
                                    password: passwordEditingController.text));
                          },
                          child: const Text(
                            "CADASTRAR",
                            style: TextStyle(color: Colors.black, fontSize: 16),
                          )),
                    ],
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
