import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magicview/bloc/genres_bloc/genres_bloc.dart';
import 'package:magicview/bloc/get_favorite_bloc/get_favorite_bloc.dart';
import 'package:magicview/bloc/movie_popular_bloc/movie_popular_bloc.dart';
import 'package:magicview/bloc/movies_genres_popular_page.dart/movie_genres_popular_bloc.dart';
import 'package:magicview/entities/results.dart';
import 'package:magicview/pages/components/my_bottom_navigation_bar.dart';
import 'package:magicview/pages/components/my_text.dart';
import 'package:magicview/pages/components/my_text_title.dart';
import 'package:magicview/pages/genres_page/genres_movie_popular_page.dart';
import 'package:magicview/pages/genres_page/genres_page.dart';
import 'package:magicview/pages/movie_page/movie_popular_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int genreIdsDefault = 28;
  bool hasMovieSelect = true;
  bool hasGenresMovieSelect = true;
  String typeMovieOrTv = "movie";
  String typeMovieOrTvGenres = "movie";
  //da 30 a 39
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff21005D),
      bottomNavigationBar: MyBottonNavigationBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    MyTextTitle(message: "MAGICVIEW"),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                        onTap: () {
                          typeMovieOrTv = "movie";
                          setState(() {
                            hasMovieSelect = true;
                          });
                          context.read<MoviePopularBloc>().add(
                              MoviePopularEventLoaded(
                                  page: 1,
                                  langague: 'pt-br',
                                  results: const <Results>[],
                                  typeMovieOrTv: typeMovieOrTv));

                          // context.read<GenresBloc>().add(GenresEventSubmit(
                          //     typeMovieOrSerie: typeMovieOrTv));
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            decoration: (hasMovieSelect)
                                ? BoxDecoration(
                                    color: Theme.of(context).primaryColor,
                                    borderRadius: BorderRadius.circular(5))
                                : BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                            child: Text(
                              "Filmes Populares",
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.secondary,
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        )),
                    InkWell(
                      onTap: () {
                        typeMovieOrTv = "tv";
                        setState(() {
                          hasMovieSelect = false;
                        });
                        context.read<MoviePopularBloc>().add(
                            MoviePopularEventLoaded(
                                page: 1,
                                langague: 'pt-br',
                                results: const <Results>[],
                                typeMovieOrTv: typeMovieOrTv));
                        // context.read<GenresBloc>().add(
                        //     GenresEventSubmit(typeMovieOrSerie: typeMovieOrTv));
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: (!hasMovieSelect)
                            ? BoxDecoration(
                                color: Theme.of(context).primaryColor,
                                borderRadius: BorderRadius.circular(5))
                            : BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                              ),
                        child: Text(
                          "Séries Populares",
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.secondary,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                MoviePopularPages(typeMovieOrSerie: typeMovieOrTv),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const MyText(
                      title: "Gêneros: ",
                      fontSize: 16,
                    ),
                    InkWell(
                      onTap: () {
                        typeMovieOrTvGenres = "movie";
                        setState(() {
                          hasGenresMovieSelect = true;
                        });
                        context.read<GenresBloc>().add(GenresEventSubmit(
                            typeMovieOrSerie: typeMovieOrTvGenres));
                        context.read<GenresBloc>().add(GenresEventSubmit(
                            typeMovieOrSerie: typeMovieOrTvGenres));
                        context.read<MovieGenresPopularBloc>().add(
                            MovieGenresPopularEventByIdLoaded(genreIdsDefault,
                                1, 'pt-br', typeMovieOrTvGenres));
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: (hasGenresMovieSelect)
                              ? BoxDecoration(
                                  color: Theme.of(context).primaryColor,
                                  borderRadius: BorderRadius.circular(5))
                              : BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                          child: Text(
                            "Filmes",
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.secondary,
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        typeMovieOrTvGenres = "tv";
                        setState(() {
                          hasGenresMovieSelect = false;
                        });
                        context.read<GenresBloc>().add(GenresEventSubmit(
                            typeMovieOrSerie: typeMovieOrTvGenres));
                        context.read<MovieGenresPopularBloc>().add(
                            MovieGenresPopularEventByIdLoaded(
                                10759, 1, 'pt-br', typeMovieOrTvGenres));
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: (!hasGenresMovieSelect)
                              ? BoxDecoration(
                                  color: Theme.of(context).primaryColor,
                                  borderRadius: BorderRadius.circular(5))
                              : BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                          child: Text(
                            "Série",
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.secondary,
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                GenresPage(typeMovieOrFilme: typeMovieOrTvGenres),
                const SizedBox(
                  height: 10,
                ),
                GenresMoviePopularPage(
                  typeMovieOrTv: typeMovieOrTvGenres,
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(5)),
                  child: const MyText(
                    title: "Favoritos",
                    fontSize: 14,
                  ),
                ),
                SizedBox(
                    height: 138,
                    child: BlocBuilder<GetFavoriteBloc, GetFavoriteStateBloc>(
                      builder: (context, state) {
                        if (state is GetFavoriteLoandingStateLocalSavedBloc) {
                          return const CircularProgressIndicator();
                        }
                        if (state is GetFavoriteLoandedStateLocalSavedBloc) {
                          return ListView.separated(
                            scrollDirection: Axis.horizontal,
                            padding: const EdgeInsets.all(2),
                            itemCount: state.favoriteMovie.length,
                            itemBuilder: (BuildContext context, int index) {
                              return GestureDetector(
                                onTap: () {
                                  // Navigator.pushNamed(
                                  //     context, AppRoutes.detailMovie,
                                  //     arguments: ScreenArguments(
                                  //         state.favoriteMovie[index].id,
                                  //         state.favoriteMovie[index].popularity,
                                  //         state.favoriteMovie[index].title,
                                  //         state.favoriteMovie[index].overview,
                                  //         state.favoriteMovie[index].posterPath,
                                  //         state.favoriteMovie[index].backdropPath,
                                  //         state.favoriteMovie[index].voteAverage,
                                  //         result[index].voteCount,
                                  //         widget.typeMovieOrSerie));
                                },
                                child: Stack(
                                    alignment: AlignmentDirectional.topStart,
                                    children: [
                                      SizedBox(
                                        height: 140,
                                        child: Image.file(
                                          File(state.favoriteMovie[index]
                                              .postPathLocal),
                                          fit: BoxFit.fill,
                                          alignment: Alignment.center,
                                        ),
                                      ),
                                      TextButton(
                                        onPressed: () => showDialog<String>(
                                          context: context,
                                          builder: (BuildContext context) =>
                                              AlertDialog(
                                            backgroundColor: Colors.red[50],
                                            title: const Text('FAVORITOS'),
                                            content:
                                                const Text('Deseja Excluir ?'),
                                            actions: <Widget>[
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    context, 'Cancel'),
                                                child: const Text('Cancel'),
                                              ),
                                              TextButton(
                                                onPressed: () {
                                                  context
                                                      .read<GetFavoriteBloc>()
                                                      .add(FavoriteDeleteImageEvent(
                                                          id: state
                                                              .favoriteMovie[
                                                                  index]
                                                              .id,
                                                          userId: state
                                                              .favoriteMovie[
                                                                  index]
                                                              .userId,
                                                          fileName: state
                                                              .favoriteMovie[
                                                                  index]
                                                              .postPathLocal));
                                                  Navigator.pop(context, 'Ok');
                                                },
                                                child: const Text('OK'),
                                              ),
                                            ],
                                          ),
                                        ),
                                        child: Container(
                                          width: 22,
                                          height: 22,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(11),
                                            color: Colors.purple,
                                          ),
                                          child: Center(
                                              child: Icon(Icons.delete,
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .secondary,
                                                  size: 16.0)),
                                        ),
                                      ),
                                    ]),
                              );
                            },
                            separatorBuilder:
                                (BuildContext context, int index) =>
                                    const SizedBox(
                              width: 10,
                            ),
                          );
                        } else {
                          return const Text("Falha Carregar Dados");
                        }
                      },
                    )),
              ],
            ),
          ),
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
//"/data/data/com.example.magicview/app_flutter/27052024034733.png"