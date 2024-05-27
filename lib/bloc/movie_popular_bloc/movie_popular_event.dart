part of 'movie_popular_bloc.dart';

abstract class MoviePopularEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class MoviePopularEventLoaded extends MoviePopularEvent {
  final List<Results> results;
  final int page;
  final String langague;

  MoviePopularEventLoaded(
      {required this.page, required this.langague, required this.results});
}

class MoviePopularEventMoreLoad extends MoviePopularEvent {
  final List<Results> results;
  final int page;
  final String langague;

  MoviePopularEventMoreLoad(
      {required this.page, required this.langague, required this.results});
}

// class MoviePopularEventErrorState extends MoviePopularEvent {
//   final String error;

//   MoviePopularEventErrorState(this.error);

//   @override
//   List<Object?> get props => [error];
// }
