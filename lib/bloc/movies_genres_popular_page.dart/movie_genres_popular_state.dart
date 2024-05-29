part of 'movie_genres_popular_bloc.dart';

abstract class MovieGenresPopularState extends Equatable {
  const MovieGenresPopularState();

  @override
  List<Object?> get props => [];
}

class MovieGenresPopularStateLoading extends MovieGenresPopularState {}

class MovieGenresPopularStateFetchs extends MovieGenresPopularState {
  final List<Results> results;
  final int genresId;
  final int page;
  const MovieGenresPopularStateFetchs(this.results, this.genresId, this.page);

  @override
  List<Object?> get props => [results];
}

class MovieGenresPopularErrorState extends MovieGenresPopularState {
  final String error;

  const MovieGenresPopularErrorState(this.error);

  @override
  List<Object?> get props => [error];
}
