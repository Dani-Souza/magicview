import '../entities/genres.dart';

class ResultsSeriePopular {
  final int id;
  final bool adult;
  final String backdropPath;
  final List<Genres> genres;
  final List<String> originCountry;
  final String originalLanguage;
  final String originalName;
  final String overview;
  final double popularity;
  final String posterPath;
  final String firstAirDate;
  final String name;
  final double voteAverage;
  final int voteCount;

  ResultsSeriePopular({
    required this.id,
    required this.adult,
    required this.backdropPath,
    required this.genres,
    required this.originCountry,
    required this.originalLanguage,
    required this.originalName,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.firstAirDate,
    required this.name,
    required this.voteAverage,
    required this.voteCount,
  });

  factory ResultsSeriePopular.fromJson(Map<String, dynamic> data) {
    List<Genres> genresList = [];

    if (data['genres_id'] != null) {
      List<int> genreIds = List<int>.from(data['genres_id']);
      genresList = genreIds.map((id) => Genres(id: id, name: "")).toList();
    }
    dynamic voteAverageInitial = data['vote_average'];
    double voteAverage = voteAverageInitial is int
        ? voteAverageInitial.toDouble()
        : voteAverageInitial;

    return ResultsSeriePopular(
        id: data['id'],
        adult: data['adult'],
        backdropPath: data['backdrop_path'],
        genres: genresList,
        originCountry: List<String>.from(data['origin_country'] ?? []),
        originalLanguage: data['original_language'],
        originalName: data['original_name'],
        overview: data['overview'],
        popularity: data['popularity'],
        posterPath: data['poster_path'],
        firstAirDate: data['first_air_date'],
        name: data['name'],
        voteAverage: voteAverage,
        voteCount: data['vote_count']);
  }
}
