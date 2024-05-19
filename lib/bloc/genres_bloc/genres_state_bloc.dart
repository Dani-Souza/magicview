part of "genres_bloc.dart";

abstract class GenresState extends Equatable {}

class GenresLoadingState extends GenresState {
  @override
  List<Object?> get props => [];
}

class GenresLoadedState extends GenresState {
  final List<Genres> genres;
  GenresLoadedState(this.genres);
  @override
  List<Object?> get props => [genres];
}

class GenresErrorState extends GenresState {
  final String error;

  GenresErrorState(this.error);

  @override
  List<Object?> get props => [error];
}
