class Results {
  final int id;
  final String backdropPath;
  final String overview;
  final double popularity;
  final String posterPath;
  final String firstAirDate;
  final String name;
  final double voteAverage;
  final int voteCount;

  Results({
    required this.id,
    required this.backdropPath,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.firstAirDate,
    required this.name,
    required this.voteAverage,
    required this.voteCount,
  });

  factory Results.fromJson(Map<String, dynamic> data) {
    return Results(
        id: data['id'],
        backdropPath: data['backdrop_path'],
        overview: data['overview'],
        popularity: data['popularity'],
        posterPath: data['poster_path'],
        firstAirDate: data['first_air_date'],
        name: data['name'],
        voteAverage: data['vote_average'] * 1.0,
        voteCount: data['vote_count']);
  }
}
