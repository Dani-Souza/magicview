part of 'movie_popular_bloc.dart';

abstract class MoviePopularState extends Equatable {}

class MoviePopularStateInitial extends MoviePopularState {
  @override
  List<Object?> get props => [];
}

class MoviePopularStateFetchs extends MoviePopularState {
  final List<Results> result;
  MoviePopularStateFetchs(this.result);

  @override
  List<Object?> get props => [result];
}
