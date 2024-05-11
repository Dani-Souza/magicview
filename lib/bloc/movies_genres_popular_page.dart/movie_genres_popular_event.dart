part of 'movie_genres_popular_bloc.dart';

abstract class MovieGenresPopularEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class MovieGenresPopularEventInitial extends MovieGenresPopularEvent {}

class MovieGenresPopularEventFetchs extends MovieGenresPopularEvent {}

class MovieGenresPopularEventById extends MovieGenresPopularEvent {
  final int movieId;
  final List<Results> resultList;
  MovieGenresPopularEventById(this.movieId, this.resultList);
  @override
  List<Object?> get props => [movieId, resultList];
}
