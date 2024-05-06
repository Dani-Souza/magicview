import 'dart:convert';

import 'package:magicview/entities/origin_country.dart';

import '../entities/genres.dart';

class Results {
  final int id;
  final bool adult;
  final String backdropPath;
  final List<Genres> genres;
  final String originalLanguage;
  final String originalTitle;
  final String overview;
  final double popularity;
  final String posterPath;
  final String releaseDate;
  final String title;
  final bool video;
  final double voteAverage;
  final int voteCount;

  Results({
    required this.id,
    required this.adult,
    required this.backdropPath,
    required this.genres,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.releaseDate,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });

  factory Results.fromJson(Map<String, dynamic> data) {
    List<Genres> genresList = [];

    if (data['genres_id'] != null) {
      List<int> genreIds = List<int>.from(data['genres_id']);
      genresList = genreIds.map((id) => Genres(id: id, name: "")).toList();
    }
    dynamic voteAverageInitial = data['vote_average'];
    double voteAverage = voteAverageInitial is int
        ? voteAverageInitial.toDouble()
        : voteAverageInitial;

    return Results(
        id: data['id'],
        adult: data['adult'],
        backdropPath: data['backdrop_path'],
        genres: genresList,
        originalLanguage: data['original_language'],
        originalTitle: data['original_title'],
        overview: data['overview'],
        popularity: data['popularity'],
        posterPath: data['poster_path'],
        releaseDate: data['release_date'],
        title: data['title'],
        video: data['video'],
        voteAverage: voteAverage,
        voteCount: data['vote_count']);
  }
}
