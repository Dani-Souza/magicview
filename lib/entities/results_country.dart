import '../entities/genres.dart';

class ResultsCountry {
  final int id;
  final bool adult;
  final String backdrop_path;
  final List<Genres> genres;
  final List<String> origin_country;
  final String original_language;
  final String original_name;
  final String overview;
  final double popularity;
  final String poster_path;
  final String firstAirDate;
  final String name;
  final double vote_average;
  final int vote_count;

  ResultsCountry({
    required this.id,
    required this.adult,
    required this.backdrop_path,
    required this.genres,
    required this.origin_country,
    required this.original_language,
    required this.original_name,
    required this.overview,
    required this.popularity,
    required this.poster_path,
    required this.firstAirDate,
    required this.name,
    required this.vote_average,
    required this.vote_count,
  });

  factory ResultsCountry.fromJson(Map<String, dynamic> data) {
    List<Genres> genresList = [];

    if (data['genres_id'] != null) {
      List<int> genreIds = List<int>.from(data['genres_id']);
      genresList = genreIds.map((id) => Genres(id: id, name: "")).toList();
    }
    dynamic voteAverageInitial = data['vote_average'];
    double voteAverage = voteAverageInitial is int
        ? voteAverageInitial.toDouble()
        : voteAverageInitial;

    return ResultsCountry(
        id: data['id'],
        adult: data['adult'],
        backdrop_path: data['backdrop_path'],
        genres: genresList,
        origin_country: List<String>.from(data['origin_country'] ?? []),
        original_language: data['original_language'],
        original_name: data['original_name'],
        overview: data['overview'],
        popularity: data['popularity'],
        poster_path: data['poster_path'],
        firstAirDate: data['first_air_date'],
        name: data['name'],
        vote_average: voteAverage,
        vote_count: data['vote_count']);
  }
}
