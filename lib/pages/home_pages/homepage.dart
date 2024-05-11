import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:magicview/entities/results.dart';
import 'package:magicview/pages/home_pages/genres_page.dart';
import 'package:magicview/pages/home_pages/movie_popular_page.dart';
import 'package:magicview/pages/home_pages/mySearch.dart';
import 'package:magicview/pages/home_pages/serie_popular_page.dart';
import 'package:magicview/utility/data_movie_popular_api.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int positionGenres = 0;
  int genreIdsDefault = 28;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        items: [
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
                    MySearch(),
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
                MoviePopularPages(),
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
                SeriePopularPage(),
                // generos
                const SizedBox(
                  height: 10,
                ),
                GenresPage(),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 138,
                  child: FutureBuilder<List<Results>>(
                    future: DataMoviePopularApi.getMoviePopularById(
                        genreIdsDefault),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        List<Results>? resultSearch = snapshot.data;
                        return ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: resultSearch!.length,
                          separatorBuilder: (BuildContext context, int index) =>
                              const SizedBox(
                            width: 10,
                          ),
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              height: 50,
                              width: 92,
                              decoration: BoxDecoration(
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          "https://media.themoviedb.org/t/p/w220_and_h330_face/${resultSearch[index].posterPath}")),
                                  borderRadius: BorderRadius.circular(5)),
                            );
                          },
                        );
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Future<List<Results>> _loadResultData(int genres_id) async {
    List<Results> results = [];
    String data = await rootBundle.loadString('assets/data/$genres_id.json');
    final jsonData = json.decode(data);
    final jsonResults = jsonData["results"];

    for (var json in jsonResults) {
      Results resultList = Results.fromJson(json);

      results.add(resultList);
    }

    return results;
  }
}
