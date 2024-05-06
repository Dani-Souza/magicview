import 'package:magicview/entities/results.dart';

class MoviePopular {
  final int page;
  final int total_pages;
  final int total_results;
  List<Results> result;

  MoviePopular({
    required this.page,
    required this.total_pages,
    required this.total_results,
    required this.result,
  });

  factory MoviePopular.fromJson(Map<String, dynamic> data) {
    return MoviePopular(
        page: data["page"],
        total_pages: data["total_pages"],
        total_results: data["total_results"],
        result: data["result"]);
  }
}
