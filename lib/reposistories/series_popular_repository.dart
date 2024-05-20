import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:magicview/entities/results_serie_popular.dart';
import 'package:magicview/utility/constants.dart';

class SeriePopularRepository {
  static Future<List<Results>> getSeriePopular(
      int page, String language) async {
    List<Results> resultList = [];

    try {
      var url = Uri.https('${Constants.URL_API}', '3/tv/popular', {
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
}
