import 'dart:convert';

import 'package:magicview/entities/movie_credits.dart';
import 'package:http/http.dart' as http;
import 'package:magicview/utility/constants.dart';

class CreditsRepository {
  static Future<List<MovieCredits>> getMovieCredits(
      int movieId, String language) async {
    List<MovieCredits> listMovieCredits = [];

    var url = Uri.https(
        Constants.URL_API, '3/movie/$movieId/credits', {'language': language});

    final response = await http.get(url, headers: {
      'Authorization': Constants.TOKEN_BEAR,
    });

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final jsonMovieCredits = jsonData['cast'];

      for (var json in jsonMovieCredits) {
        MovieCredits listCredits = MovieCredits.fromJson(json);
        listMovieCredits.add(listCredits);
      }
      return listMovieCredits;
    }

    return listMovieCredits;
  }
}
