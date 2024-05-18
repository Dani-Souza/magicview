import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:magicview/entities/results_serie_popular.dart';

class DataSeriePopularApi {
  static Future<List<Results>> getAllSeriePopular() async {
    List<Results> resultsSeriePopular = [];
    String data = await rootBundle.loadString('assets/data/serie_popular.json');
    final jsonData = json.decode(data);
    final jsonResults = jsonData["results"];

    for (var json in jsonResults) {
      Results resultList = Results.fromJson(json);

      resultsSeriePopular.add(resultList);
    }

    return resultsSeriePopular;
  }
}
