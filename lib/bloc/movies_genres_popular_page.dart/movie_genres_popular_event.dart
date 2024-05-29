part of 'movie_genres_popular_bloc.dart';

abstract class MovieGenresPopularEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

//class MovieGenresPopularEventLoading extends MovieGenresPopularEvent {}

// class MovieGenresPopularEventFetchs extends MovieGenresPopularEvent {}

class MovieGenresPopularEventByIdLoaded extends MovieGenresPopularEvent {
  final int genresId;
  final int page;
  final String language;
  final String typeMovieOrTv;

  MovieGenresPopularEventByIdLoaded(
      this.genresId, this.page, this.language, this.typeMovieOrTv);
  @override
  List<Object?> get props => [genresId, page, language];
}

class MovieEventGenresMoreLoadById extends MovieGenresPopularEvent {
  final int genresId;
  final int page;
  final String language;
  final String typeMovieOrTv;

  MovieEventGenresMoreLoadById(
      this.genresId, this.page, this.language, this.typeMovieOrTv);
  @override
  List<Object?> get props => [genresId, page, language, typeMovieOrTv];
}
