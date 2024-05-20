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
/*
--url 'https://api.themoviedb.org/3/discover/movie?
include_adult=false&include_video=false
&language=pt-br&page=1
&sort_by=popularity.desc&with_genres=28' \
     
     --header 'accept: application/json'
*/

  static Future<List<Results>> getMoviePopularByGenresId(
      int genresId, int page, String language) async {
    List<Results> resultMovies = [];
    try {
      var url = Uri.https('${Constants.URL_API}', '/3/discover/movie', {
        'language': '$language',
        'page': '$page',
        'sort_by': 'popularity.desc',
        'with_genres': '$genresId',
      });

      final response = await http.get(url, headers: {
        'Authorization': Constants.TOKEN_BEAR,
      });

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonData = jsonDecode(response.body);
        final jsonResult = jsonData["results"];

        for (var json in jsonResult) {
          Results resultJson = Results.fromJson(json);
          resultMovies.add(resultJson);
        }
        return resultMovies;
      } else {
        return resultMovies;
      }
    } catch (e) {
      return resultMovies;
    }
  }
}
