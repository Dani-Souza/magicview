import 'dart:convert';

import 'package:magicview/entities/origin_country.dart';

import '../entities/genres.dart';

class Results {
  final int id;
  final bool adult;
  final String backdrop_path;
  final List<Genres> genres;
  final String original_language;
  final String original_title;
  final String overview;
  final double popularity;
  final String poster_path;
  final String release_date;
  final String title;
  final bool video;
  final double vote_average;
  final int vote_count;

  Results({
    required this.id,
    required this.adult,
    required this.backdrop_path,
    required this.genres,
    required this.original_language,
    required this.original_title,
    required this.overview,
    required this.popularity,
    required this.poster_path,
    required this.release_date,
    required this.title,
    required this.video,
    required this.vote_average,
    required this.vote_count,
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
        backdrop_path: data['backdrop_path'],
        genres: genresList,
        original_language: data['original_language'],
        original_title: data['original_title'],
        overview: data['overview'],
        popularity: data['popularity'],
        poster_path: data['poster_path'],
        release_date: data['release_date'],
        title: data['title'],
        video: data['video'],
        vote_average: voteAverage,
        vote_count: data['vote_count']);
  }
}
