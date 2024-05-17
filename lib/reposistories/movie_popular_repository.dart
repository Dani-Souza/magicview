import 'dart:convert';

import 'package:magicview/entities/movie_details.dart';
import 'package:magicview/entities/results.dart';
import 'package:magicview/utility/constants.dart';
import 'package:http/http.dart' as http;

class MoviePopularRepository {
//'https://api.themoviedb.org/3/movie/popular?language=pt&page=1'

  static Future<List<Results>> getMoviePopular(
      int page, String language) async {
    List<Results> resultList = [];

    try {
      var url = Uri.https('${Constants.URL_API}', '/3/movie/popular', {
        'language': '$language',
        'page': '$page',
        'sort_by': 'popularity.desc',
      });

      final response = await http.get(url, headers: {
        'Authorization': Constants.TOKEN_BEAR,
      });

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonData = jsonDecode(response.body);
        final jsonResults = jsonData["results"];

        for (var json in jsonResults) {
          Results list = Results.fromJson(json);
          resultList.add(list);
        }

        return resultList;
      } else {
        return resultList;
      }
    } catch (e) {
      return resultList;
    }
  }

  static Future<MovieDetail> fetchMoviesDetailById(
      int genresId, String language) async {
    try {
      var url = Uri.https(Constants.URL_API, '3/movie/$genresId', {
        'language': '$language',
      });
      final response = await http.get(url, headers: {
        'Authorization': '${Constants.TOKEN_BEAR}',
      });
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);

        return MovieDetail.fromJson(data);
      } else {
        throw Exception('Failed to fetch movies');
      }
    } catch (e) {
      throw Exception('Failed to fetch movies');
    }
  }

  // static Future<List<Results>> getMoviePopularById(int genresId, String language) async {
  //   MovieDetail results;

  //   try {
  //     //https://api.themoviedb.org/3/movie/movie_id?language=en-US'
  //     var url = Uri.https('${Constants.URL_API}', '3/movie/{$genresId}', {
  //       'language': '$language',
  //     });
  //     final response = await http.get(url, headers: {
  //       'Authorization': '${Constants.TOKEN_BEAR}',
  //     });
  //     if (response.statusCode == 200) {
  //       final Map<String, dynamic> jsonData = jsonDecode(response.body);

  //     }
  //   } catch (e) {}

  // }
}
