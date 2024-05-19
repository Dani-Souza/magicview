import 'package:magicview/entities/results.dart';

class MoviePopular {
  int page;
  int totalPages;
  int totalResults;
  List<Results> result;

  MoviePopular({
    required this.page,
    required this.totalPages,
    required this.totalResults,
    required this.result,
  });

  factory MoviePopular.fromJson(Map<String, dynamic> data) {
    var resultList = data['result'] = [];

    // List<int> genreIds = List<int>.from(data['genres_id']);
    // List<Genres> genresList =
    //     genreIds.map((id) => Genres(id: id, name: "")).toList();

    List<Results> resultsList = resultList.map((item) {
      // Mapear apenas os campos necessários da Results
      return Results.fromJson({
        'id': item['id'],
        'popularity': item['popularity'],
        'posterPath': item['poster_path'],
        'voteAverage': item['vote_average'],
        'voteCount': item['vote_count']

        // Outros campos da Results, se necessário
      });
    }).toList();

    return MoviePopular(
        page: data["page"],
        totalPages: data["total_pages"],
        totalResults: data["total_results"],
        result: resultsList);
  }
}
