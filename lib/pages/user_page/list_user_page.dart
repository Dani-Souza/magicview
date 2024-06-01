import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magicview/app_routes.dart';
import 'package:magicview/bloc/get_favorite_bloc/get_favorite_bloc.dart';
import 'package:magicview/bloc/get_favorite_by_user/get_favorite_by_user_id_bloc.dart';
import 'package:magicview/bloc/get_users/get_user_bloc.dart';
import 'package:magicview/pages/components/my_text_title.dart';
import 'package:magicview/pages/user_page/list_favorites_by_user_id_page.dart';

class ListUserPage extends StatefulWidget {
  const ListUserPage({super.key});

  @override
  State<ListUserPage> createState() => _ListUserPageState();
}

class _ListUserPageState extends State<ListUserPage> {
  @override
  Widget build(BuildContext context) {
    //  double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color(0xff21005D),
      bottomNavigationBar: BottomNavigationBar(
        //  type: BottomNavigationBarType.fixed,
        backgroundColor: Theme.of(context).colorScheme.secondary,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: ""),
          //  BottomNavigationBarItem(icon: Icon(Icons.favorite), label: ""),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: BlocBuilder<GetUserBloc, GetUserStateBloc>(
              builder: (context, state) {
            if (state is GetUserLoadingState) {
              return const CircularProgressIndicator();
            }
            if (state is GetUserErrorState) {
              return Text(
                state.message,
              );
            }

            if (state is GetUserLoadedState) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        MyTextTitle(message: "MAGICVIEW - Lista de Usuários"),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: screenHeight,
                      child: ListView.separated(
                        padding: const EdgeInsets.all(8),
                        itemCount: state.user.length,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        ListFavoritesByUserIdPage(
                                            userId: state.user[index].id!)),
                              );

                              // Navigator.pushNamed(
                              //   context,
                              //   AppRoutes.favoriteByUser,
                              //   arguments: {'userId': state.user[index].id},
                              // );
                            },
                            child: Container(
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                              child:
                                  Center(child: Text(state.user[index].nick!)),
                            ),
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) =>
                            const SizedBox(
                          height: 10,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            } else {
              return const CircularProgressIndicator();
            }
          }),
        ),
      ),
    );
    //<- place where the image appears
  }
}
