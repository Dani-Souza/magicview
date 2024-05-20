import 'dart:convert';

import 'package:magicview/entities/credits.dart';
import 'package:http/http.dart' as http;
import 'package:magicview/utility/constants.dart';

class CreditsRepository {
  static Future<List<Credits>> getCredits(
      int movieId, String language, String typeMovieOrSerie) async {
    List<Credits> listMovieCredits = [];

    try {
      var url = Uri.https(Constants.URL_API,
          '3/$typeMovieOrSerie/$movieId/credits', {'language': language});

      final response = await http.get(url, headers: {
        'Authorization': Constants.TOKEN_BEAR,
      });

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        final jsonMovieCredits = jsonData['cast'];

        for (var json in jsonMovieCredits) {
          Credits listCredits = Credits.fromJson(json);
          listMovieCredits.add(listCredits);
        }
        return listMovieCredits;
      } else {
        return listMovieCredits;
      }
    } catch (e) {
      return listMovieCredits;
    }
  }

  static Future<String?> getTrailer(
      int movieId, String language, String typeMovieorTv) async {
    try {
      var url = Uri.https(Constants.URL_API, '3/$typeMovieorTv/$movieId/videos',
          {'language': language});

      final response = await http.get(url, headers: {
        'Authorization': Constants.TOKEN_BEAR,
      });

      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);
        return jsonData["results"][0]["key"];
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}
