class ScreenArguments {
  final int id;
  final double popularity;
  final String title;
  final String? overview;
  final String posterPath;
  final String backdropPath;
  final double voteAverage;
  final int voteCount;
  final String typeMovieOrTV;

  ScreenArguments(
    this.id,
    this.popularity,
    this.title,
    this.overview,
    this.posterPath,
    this.backdropPath,
    this.voteAverage,
    this.voteCount,
    this.typeMovieOrTV,
  );
}
