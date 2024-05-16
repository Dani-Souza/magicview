import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:magicview/entities/genres.dart';
import 'package:magicview/utility/constants.dart';

class GenresRepository {
  static Future<List<Genres>> getMovieGenres(String language) async {
    List<Genres> genres = [];
    var url = Uri.https(
        Constants.URL_API, '/3/genre/movie/list', {'language': language});

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
    }

    return genres;
  }

  // static getAll() async {
  //   var url = Uri.https('jsonplaceholder.typicode.com', '/post');

  //   // Await the http get response, then decode the json-formatted response.
  //   var response = await http.get(url);
  //   if (response.statusCode == 200) {
  //     final jsonResponse = json.decode(response.body);
  //     var itemCount = jsonResponse['totalItems'];
  //     print('Number of books about http: $itemCount.');
  //   } else {
  //     print('Request failed with status: ${response.statusCode}.');
  //   }
  // }
//  final responseJson = jsonDecode(response.body) as Map<String, dynamic>;
}
