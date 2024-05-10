part of 'movie_popular_bloc.dart';

abstract class MoviePopularEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class MoviePopularEventInitial extends MoviePopularEvent {}

class MoviePopularEventFetchs extends MoviePopularEvent {}
