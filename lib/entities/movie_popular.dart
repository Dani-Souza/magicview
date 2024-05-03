import 'package:magicview/entities/movie_result.dart';

class MoviePopular{
final int page;
final int total_pages;
final int total_results;
 List<MovieResult> movieResult;

MoviePopular({
required this.page,
required this.total_pages,
required this.total_results,
required this.movieResult,
});
}