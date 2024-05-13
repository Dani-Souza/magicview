class MovieDetail {
  final String backdropPath;
  final String overview;
  final String posterPath;
  final String title;
  final double voteAverage;
  final int voteCount;

  MovieDetail(
      {required this.backdropPath,
      required this.overview,
      required this.posterPath,
      required this.title,
      required this.voteAverage,
      required this.voteCount});

  factory MovieDetail.fromJson(Map<String, dynamic> data) {
    return MovieDetail(
        backdropPath: data['backdrop_path'],
        overview: data['overview'],
        posterPath: data['poster_path'],
        title: data['title'],
        voteAverage: data['vote_average'],
        voteCount: data['overview']);
  }
}
