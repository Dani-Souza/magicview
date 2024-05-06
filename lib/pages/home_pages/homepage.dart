import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:magicview/entities/genres.dart';
import 'package:magicview/entities/results.dart';
import 'package:magicview/entities/results_country.dart';
import 'package:magicview/pages/home_pages/mySearch.dart';

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
                SizedBox(
                    height: 204,
                    child: FutureBuilder<List<Results>>(
                      future: _loadMoviePopularData('movie_popular'),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          List<Results>? resultado = snapshot.data;
                          return ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemCount: resultado!.length,
                            separatorBuilder:
                                (BuildContext context, int index) =>
                                    const SizedBox(width: 10),
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                height: 204,
                                width: 136,
                                decoration: BoxDecoration(
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            "https://media.themoviedb.org/t/p/w220_and_h330_face/${resultado[index].posterPath}")),
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
                    )),

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
                SizedBox(
                    height: 204,
                    child: FutureBuilder<List<ResultsCountry>>(
                      future: _loadSeriePopularData('serie_popular'),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          List<ResultsCountry>? resultado = snapshot.data;
                          return ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemCount: resultado!.length,
                            separatorBuilder:
                                (BuildContext context, int index) =>
                                    const SizedBox(width: 10),
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                height: 204,
                                width: 136,
                                decoration: BoxDecoration(
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            "https://media.themoviedb.org/t/p/w220_and_h330_face/${resultado[index].posterPath}")),
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
                    )),

                const SizedBox(
                  height: 10,
                ),

                // generos
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 20,
                  child: FutureBuilder<List<Genres>>(
                    future: _loadGenresData(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        List<Genres>? restultGenres = snapshot.data;
                        return ListView.separated(
                          itemCount: restultGenres!.length,
                          scrollDirection: Axis.horizontal,
                          separatorBuilder: (BuildContext context, int index) =>
                              const SizedBox(width: 10),
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              height: 260,
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              decoration: (index == positionGenres)
                                  ? BoxDecoration(
                                      color: Theme.of(context).primaryColor,
                                      borderRadius: BorderRadius.circular(5))
                                  : BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    positionGenres = index;
                                    setState(() {
                                      genreIdsDefault = restultGenres[index].id;
                                      _loadResultData(genreIdsDefault);
                                    });
                                  });
                                },
                                child: Text(
                                  '${restultGenres[index].name}',
                                  style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
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
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 138,
                  child: FutureBuilder<List<Results>>(
                    future: _loadResultData(genreIdsDefault),
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

  Future<List<Genres>> _loadGenresData() async {
    List<Genres> genres = [];
    String data = await rootBundle.loadString('assets/data/genres.json');
    final jsonData = json.decode(data);
    final jsonGenres = jsonData["genres"];

    for (var json in jsonGenres) {
      Genres genresList = Genres.fromJson(json);
      genres.add(genresList);
    }
    return genres;
  }

  Future<List<Results>> _loadMoviePopularData(String type) async {
    List<Results> results = [];
    String data = await rootBundle.loadString('assets/data/$type.json');
    final jsonData = json.decode(data);
    final jsonResults = jsonData["results"];

    for (var json in jsonResults) {
      Results resultList = Results.fromJson(json);

      results.add(resultList);
    }

    return results;
  }

  Future<List<ResultsCountry>> _loadSeriePopularData(String type) async {
    List<ResultsCountry> results = [];
    String data = await rootBundle.loadString('assets/data/$type.json');
    final jsonData = json.decode(data);
    final jsonResults = jsonData["results"];

    for (var json in jsonResults) {
      ResultsCountry resultList = ResultsCountry.fromJson(json);

      results.add(resultList);
    }

    return results;
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
