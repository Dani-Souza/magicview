import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magicview/bloc/favorite_bloc/favorite_bloc.dart';
import 'package:magicview/bloc/genres_bloc/genres_bloc.dart';
import 'package:magicview/bloc/movie_popular_bloc/movie_popular_bloc.dart';
import 'package:magicview/bloc/movies_genres_popular_page.dart/movie_genres_popular_bloc.dart';
import 'package:magicview/entities/results.dart';
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

  @override
  Widget build(BuildContext context) {
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

                          context.read<GenresBloc>().add(GenresEventLoaded(
                              typeMovieOrSerie: typeMovieOrTv));
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          child: Text(
                            "Filmes Populares",
                            style: TextStyle(
                              backgroundColor: hasMovieSelect
                                  ? Theme.of(context).colorScheme.primary
                                  : Colors.transparent,
                              color: Theme.of(context).colorScheme.secondary,
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
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
                        context.read<GenresBloc>().add(
                            GenresEventLoaded(typeMovieOrSerie: typeMovieOrTv));
                      },
                      child: Text(
                        "Séries Populares",
                        style: TextStyle(
                          backgroundColor: !hasMovieSelect
                              ? Theme.of(context).colorScheme.primary
                              : Colors.transparent,
                          color: Theme.of(context).colorScheme.secondary,
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
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
                      fontSize: 18,
                    ),
                    InkWell(
                      onTap: () {
                        typeMovieOrTvGenres = "movie";
                        setState(() {
                          hasGenresMovieSelect = true;
                        });
                        context.read<GenresBloc>().add(GenresEventLoaded(
                            typeMovieOrSerie: typeMovieOrTvGenres));
                        context.read<GenresBloc>().add(GenresEventLoaded(
                            typeMovieOrSerie: typeMovieOrTvGenres));
                        context.read<MovieGenresPopularBloc>().add(
                            MovieGenresPopularEventByIdLoaded(genreIdsDefault,
                                1, 'pt-br', typeMovieOrTvGenres));
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        child: Text(
                          "Filmes",
                          style: TextStyle(
                            backgroundColor: hasGenresMovieSelect
                                ? Theme.of(context).colorScheme.primary
                                : Colors.transparent,
                            color: Theme.of(context).colorScheme.secondary,
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
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
                        context.read<GenresBloc>().add(GenresEventLoaded(
                            typeMovieOrSerie: typeMovieOrTvGenres));
                        context.read<MovieGenresPopularBloc>().add(
                            MovieGenresPopularEventByIdLoaded(
                                10759, 1, 'pt-br', typeMovieOrTvGenres));
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        child: Text(
                          "Série",
                          style: TextStyle(
                            backgroundColor: !hasGenresMovieSelect
                                ? Theme.of(context).colorScheme.primary
                                : Colors.transparent,
                            color: Theme.of(context).colorScheme.secondary,
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
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
                MyText(
                  title: "Favoritos",
                  fontSize: 14,
                ),
                SizedBox(
                    height: 138,
                    child: BlocBuilder<FavoriteBloc, FavoriteStateBloc>(
                      builder: (context, state) {
                        if (state is FavoriteLoadingSavedLocalState) {
                          return const CircularProgressIndicator();
                        }
                        if (state is FavoriteLoadedSavedLocalState) {
                          return ListView.separated(
                            scrollDirection: Axis.horizontal,
                            padding: const EdgeInsets.all(8),
                            itemCount: state.favorite.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                height: 50,
                                child: Image.file(
                                  File(state.favorite[index].postPathLocal),
                                  fit: BoxFit.fill,
                                  alignment: Alignment.center,
                                ),
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