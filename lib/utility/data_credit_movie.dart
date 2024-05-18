import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:magicview/entities/credits.dart';

class DataMovieCredit {
  static Future<List<Credits>> getMovieCredit(int movieId) async {
    List<Credits> movieCredits = [];
    String data =
        await rootBundle.loadString('assets/data/${movieId}_movie_credit.json');
    final jsonData = json.decode(data);
    final jsonResult = jsonData['cast'];

    for (var json in jsonResult) {
      Credits genresList = Credits.fromJson(json);
      movieCredits.add(genresList);
    }

    return movieCredits;
  }
}
