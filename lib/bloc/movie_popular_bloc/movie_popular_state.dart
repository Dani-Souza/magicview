part of 'movie_popular_bloc.dart';

abstract class MoviePopularState extends Equatable {}

class MoviePopularLoadingState extends MoviePopularState {
  @override
  List<Object?> get props => [];
}

class MoviePopularFetchsState extends MoviePopularState {
  final List<Results> result;

  MoviePopularFetchsState(this.result);

  @override
  List<Object?> get props => [result];
}

class MoviePopularErrorState extends MoviePopularState {
  final String error;

  MoviePopularErrorState(this.error);

  @override
  List<Object?> get props => [error];
}
