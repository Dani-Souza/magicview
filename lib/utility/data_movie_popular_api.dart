import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:magicview/entities/results.dart';

class DataMoviePopularApi {
  static Future<List<Results>> getAllMoviePopular() async {
    List<Results> resultsMoviePopular = [];
    String data = await rootBundle.loadString('assets/data/movie_popular.json');
    final jsonData = json.decode(data);
    final jsonResults = jsonData["results"];

    for (var json in jsonResults) {
      Results resultList = Results.fromJson(json);

      resultsMoviePopular.add(resultList);
    }
    return resultsMoviePopular;
  }

  static Future<List<Results>> getMoviePopularById(int genresId) async {
    List<Results> results = [];
    String data = await rootBundle.loadString('assets/data/$genresId.json');
    final jsonData = json.decode(data);
    final jsonResults = jsonData["results"];

    for (var json in jsonResults) {
      Results resultList = Results.fromJson(json);

      results.add(resultList);
    }

    return results;
  }
}
