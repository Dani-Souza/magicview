import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magicview/bloc/genres_bloc/genres_bloc.dart';
import 'package:magicview/bloc/movie_popular_bloc/movie_popular_bloc.dart';
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
  @override
  void initState() {
    context.read<GenresBloc>().add(GenresEventLoaded());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String typeMovieOrTv = "movie";

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
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    MyTextTitle(message: "MAGICVIEW"),
                  ],
                ),
                // Row(
                //   children: [
                //     MySearchPage(),
                //   ],
                // ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                        onTap: () {
                          typeMovieOrTv = "movie";
                          context.read<MoviePopularBloc>().add(
                              MoviePopularEventLoaded(
                                  page: 1,
                                  langague: 'pt-br',
                                  results: const <Results>[],
                                  typeMovieOrTv: typeMovieOrTv));
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
                        setState(() {
                          hasMovieSelect = true;
                        });
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
                const Row(
                  children: [
                    MyText(
                      title: "Série Populares",
                      fontSize: 18,
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                //   const SeriePopularPage(),
                // generos
                const SizedBox(
                  height: 10,
                ),
                const GenresPage(),
                const SizedBox(
                  height: 10,
                ),
                const GenresMoviePopularPage(),
              ],
            ),
          ),
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
