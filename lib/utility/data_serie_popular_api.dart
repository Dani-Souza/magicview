import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:magicview/entities/results_serie_popular.dart';

class DataSeriePopularApi {
  static Future<List<ResultsSeriePopular>> getAllSeriePopular() async {
    List<ResultsSeriePopular> resultsSeriePopular = [];
    String data = await rootBundle.loadString('assets/data/serie_popular.json');
    final jsonData = json.decode(data);
    final jsonResults = jsonData["results"];

    for (var json in jsonResults) {
      ResultsSeriePopular resultList = ResultsSeriePopular.fromJson(json);

      resultsSeriePopular.add(resultList);
    }

    return resultsSeriePopular;
  }
}
