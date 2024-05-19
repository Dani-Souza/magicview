import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/services.dart';
import 'package:magicview/entities/genres.dart';
import 'package:magicview/utility/constants.dart';

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

  static Future<List<Genres>> getMovieGenres(String languague) async {
    List<Genres> result = [];
    var url = Uri.https(
      Constants.URL_API,
      '/3/genre/movie/list',
      {'language': languague},
    );
    final response = await http.get(url, headers: {
      'Authorization': Constants.TOKEN_BEAR,
    });

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List<dynamic> results = data['results'];
      return results.map((json) => Genres.fromJson(json)).toList();
    }

    return result;
  }
}
