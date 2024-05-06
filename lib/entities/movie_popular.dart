import 'package:magicview/entities/results.dart';

class MoviePopular {
  final int page;
  final int totalPages;
  final int totalResults;
  List<Results> result;

  MoviePopular({
    required this.page,
    required this.totalPages,
    required this.totalResults,
    required this.result,
  });

  factory MoviePopular.fromJson(Map<String, dynamic> data) {
    return MoviePopular(
        page: data["page"],
        totalPages: data["total_pages"],
        totalResults: data["total_results"],
        result: data["result"]);
  }
}
