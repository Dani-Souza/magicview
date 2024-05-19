part of 'movie_genres_popular_bloc.dart';

abstract class MovieGenresPopularState extends Equatable {
  const MovieGenresPopularState();

  @override
  List<Object?> get props => [];
}

class MovieGenresPopularStateLoading extends MovieGenresPopularState {}

class MovieGenresPopularStateFetchs extends MovieGenresPopularState {
  final List<Results> results;
  const MovieGenresPopularStateFetchs(this.results);

  @override
  List<Object?> get props => [results];
}

class MovieGenresPopularStateByID extends MovieGenresPopularState {
  final List<Results> resultList;
  final int movieId;
  const MovieGenresPopularStateByID(this.movieId, this.resultList);

  @override
  List<Object?> get props => [movieId, resultList];
}
