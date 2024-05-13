import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:magicview/entities/movie_credits.dart';

class DataMovieCredit {
  static Future<List<MovieCredits>> getMovieCredit(int movieId) async {
    List<MovieCredits> movieCredits = [];
    String data =
        await rootBundle.loadString('assets/data/${movieId}_movie_credit.json');
    final jsonData = json.decode(data);
    final jsonResult = jsonData['cast'];

    for (var json in jsonResult) {
      MovieCredits genresList = MovieCredits.fromJson(json);
      movieCredits.add(genresList);
    }

    return movieCredits;
  }
}
