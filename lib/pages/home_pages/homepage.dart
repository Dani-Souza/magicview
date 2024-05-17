import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magicview/bloc/genres_bloc/genres_bloc.dart';
import 'package:magicview/pages/home_pages/genres_movie_popular_page.dart';
import 'package:magicview/pages/home_pages/genres_page.dart';
import 'package:magicview/pages/home_pages/movie_popular_page.dart';
import 'package:magicview/pages/home_pages/my_search_page.dart';
import 'package:magicview/pages/home_pages/serie_popular_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int genreIdsDefault = 28;

  @override
  void initState() {
    context.read<GenresBloc>().add(GenresEventLoaded());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff21005D),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: ""),
        ],
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "MAGICVIEW ",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.secondary,
                        fontFamily: "Righteous",
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                const Row(
                  children: [
                    MySearchPage(),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Text(
                      'Filmes Populares',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.secondary,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
                const MoviePopularPages(),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Text(
                      'Series Polulares',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.secondary,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const SeriePopularPage(),
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
