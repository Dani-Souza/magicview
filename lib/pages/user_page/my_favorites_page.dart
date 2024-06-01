import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magicview/bloc/get_my_favorite/get_my_favorite_bloc.dart';
import 'package:magicview/pages/components/my_bottom_navigation_bar.dart';
import 'package:magicview/pages/components/my_text_title.dart';

class MyFavoritesPage extends StatefulWidget {
  const MyFavoritesPage({super.key});

  @override
  State<MyFavoritesPage> createState() => _MyFavoritesPageState();
}

class _MyFavoritesPageState extends State<MyFavoritesPage> {
  @override
  void initState() {
    context.read<GetMyFavoriteBloc>().add(FetchMyFavoriteEventBloc());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    int _selectedIndex = 0;
    @override
    void onItemTapped(int index) {
      setState(() {
        _selectedIndex = index;
      });
    }

    @override
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color(0xff21005D),
      bottomNavigationBar: MyBottonNavigationBar(
          selectedIndex: _selectedIndex, onItemTapped: onItemTapped),
      body: SafeArea(
        child: SingleChildScrollView(
          child: BlocBuilder<GetMyFavoriteBloc, GetMyFavoriteStateBloc>(
              builder: (context, state) {
            if (state is GetMyFavoriteStateLoadindBloc) {
              return const CircularProgressIndicator();
            }
            if (state is GetMyFavoriteStateErrorBloc) {
              return Text(state.message);
            }
            if (state is GetMyFavoriteStateLoadedBloc) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        MyTextTitle(message: "MAGICVIEW - Minha Lista "),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                        height: screenHeight,
                        child: GridView.count(
                            addRepaintBoundaries: true,
                            childAspectRatio: .67,
                            crossAxisCount: 4,
                            crossAxisSpacing: 5,
                            mainAxisSpacing: 5,
                            padding: const EdgeInsets.fromLTRB(0, 10, 2, 0),
                            children:
                                List.generate(state.favorite.length, (index) {
                              return Container(
                                padding: const EdgeInsets.all(1),
                                decoration: BoxDecoration(
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            state.favorite[index].urlFile)),
                                    borderRadius: BorderRadius.circular(5)),
                              );
                            }))),
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
  }
}
