import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:magicview/entities/genres.dart';

class DataGenresApi {
  static Future<List<Genres>> getAllGenres() async {
    List<Genres> genres = [];
    String data = await rootBundle.loadString("assets/data/genres.json");
    final jsonData = json.decode(data);
    final jsonGenres = jsonData["genres"];

    for (var json in jsonGenres) {
      Genres genresList = Genres.fromJson(json);
      genres.add(genresList);
    }
    return genres;
  }
}
