import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magicview/bloc/genres_bloc/genres_bloc.dart';
import 'package:magicview/pages/components/my_text.dart';
import 'package:magicview/pages/components/my_text_title.dart';
import 'package:magicview/pages/genres_page/genres_movie_popular_page.dart';
import 'package:magicview/pages/genres_page/genres_page.dart';
import 'package:magicview/pages/movie_page/movie_popular_page.dart';
import 'package:magicview/pages/home_pages/my_search_page.dart';
import 'package:magicview/pages/serie_page/serie_popular_page.dart';

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
        //  type: BottomNavigationBarType.fixed,
        backgroundColor: Theme.of(context).colorScheme.secondary,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: ""),
          //  BottomNavigationBarItem(icon: Icon(Icons.favorite), label: ""),
        ],
      ),
      body: const SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
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
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    MyText(
                      title: "Filmes Populares",
                      fontSize: 18,
                    ),
                  ],
                ),
                MoviePopularPages(),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    MyText(
                      title: "Série Populares",
                      fontSize: 18,
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                SeriePopularPage(),
                // generos
                SizedBox(
                  height: 10,
                ),
                GenresPage(),
                SizedBox(
                  height: 10,
                ),
                GenresMoviePopularPage(),
              ],
            ),
          ),
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
