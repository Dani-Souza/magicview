import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:magicview/entities/genres.dart';
import 'package:magicview/utility/constants.dart';

class GenresRepository {
  Future<List<Genres>> getMovieGenres(
      String language, String typeMovieOrTv) async {
    List<Genres> genres = [];
    try {
      var url = Uri.https(Constants.URL_API, '/3/genre/$typeMovieOrTv/list',
          {'language': language});

      final response = await http.get(url, headers: {
        'Authorization': Constants.TOKEN_BEAR,
      });

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        final jsonGenres = jsonData["genres"];

        for (var json in jsonGenres) {
          Genres genresList = Genres.fromJson(json);
          genres.add(genresList);
        }
        return genres;
      } else {
        return genres;
      }
    } catch (e) {
      return genres;
    }
  }
}
