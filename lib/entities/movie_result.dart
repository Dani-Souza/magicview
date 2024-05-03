import 'package:magicview/entities/genres.dart';

class MovieResult{
final int id;
final String adult;
final String backdrop_path;
final String original_language;
final String original_title;
final String overview;
final double popularity;
final String poster_path;
final DateTime release_date;
final String title;
final String video;
final double vote_average;
final int vote_count;
final List<Genres> genres;

MovieResult({
required this.id,
required this.adult,
required this.backdrop_path,
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
required this.genres,

});
}

