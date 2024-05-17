class Results {
  final int id;
  //final List<Genres> genres;
  final double popularity;
  final String title;
  final String? overview;
  final String posterPath;
  final String backdropPath;
  final double voteAverage;
  final int voteCount;

  Results({
    required this.id,
    //required this.genres,
    required this.popularity,
    required this.title,
    required this.overview,
    required this.posterPath,
    required this.backdropPath,
    required this.voteAverage,
    required this.voteCount,
  });

  factory Results.fromJson(Map<String, dynamic> data) {
    // List<Genres> genresList = [];

    // if (data['genres_id'] != null) {
    //   List<int> genreIds = List<int>.from(data['genres_id']);
    //   genresList = genreIds.map((id) => Genres(id: id, name: "")).toList();
    // }

    return Results(
        id: data['id'],
        // genres: genresList,
        popularity: data['popularity'],
        title: data['title'],
        overview: data['overview'],
        posterPath: data['poster_path'],
        backdropPath: data['backdrop_path'],
        voteAverage: data['vote_average'] * 1.0,
        voteCount: data['vote_count']);
  }
}
