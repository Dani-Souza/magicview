part of 'movie_popular_bloc.dart';

abstract class MoviePopularState extends Equatable {}

class MoviePopularStateInitial extends MoviePopularState {
  @override
  List<Object?> get props => [];
}

class MoviePopularStateFetchs extends MoviePopularState {
  final List<Results> results;
  MoviePopularStateFetchs(this.results);

  @override
  List<Object?> get props => [results];
}
