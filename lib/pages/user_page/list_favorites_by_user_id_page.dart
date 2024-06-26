import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magicview/bloc/get_favorite_by_user/get_favorite_by_user_id_bloc.dart';
import 'package:magicview/pages/components/my_bottom_navigation_bar.dart';
import 'package:magicview/pages/components/my_text_title.dart';

class ListFavoritesByUserIdPage extends StatefulWidget {
  final String userId;
  const ListFavoritesByUserIdPage({super.key, required this.userId});

  @override
  State<ListFavoritesByUserIdPage> createState() =>
      _ListFavoritesByUserIdPageState();
}

class _ListFavoritesByUserIdPageState extends State<ListFavoritesByUserIdPage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    context
        .read<GetFavoriteByUserIdBloc>()
        .add(FetchAllFavoriteByUserid(userId: widget.userId!));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color(0xff21005D),
      bottomNavigationBar: MyBottonNavigationBar(
          selectedIndex: _selectedIndex, onItemTapped: _onItemTapped),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child:
                    MyTextTitle(message: "<< MAGICVIEW - Lista de Figurinhas"),
              ),
              BlocBuilder<GetFavoriteByUserIdBloc,
                  GetFavoriteByUserIdStateBloc>(builder: (context, state) {
                if (state is GetFavoriteByIdUserLoadingState) {
                  return const CircularProgressIndicator();
                }
                if (state is GetFavoriteByIdUserErroState) {
                  return Text(state.message);
                }
                if (state is GetFavoriteByIdUserLoadadeState) {
                  return Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
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
                                children: List.generate(
                                    state.favoriteList.length, (index) {
                                  return Container(
                                    padding: const EdgeInsets.all(1),
                                    decoration: BoxDecoration(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .secondary,
                                        image: DecorationImage(
                                            image: NetworkImage(state
                                                .favoriteList[index].urlFile)),
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
            ],
          ),
        ),
      ),
    );
  }
}
