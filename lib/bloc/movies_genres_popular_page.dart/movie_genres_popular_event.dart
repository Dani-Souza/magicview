part of 'movie_genres_popular_bloc.dart';

abstract class MovieGenresPopularEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class MovieGenresPopularEventInitial extends MovieGenresPopularEvent {}

class MovieGenresPopularEventFetchs extends MovieGenresPopularEvent {}

class MovieGenresPopularEventById extends MovieGenresPopularEvent {
  final int movieId;
  MovieGenresPopularEventById(this.movieId);
  @override
  List<Object?> get props => [movieId];
}
