part of "genres_bloc.dart";

abstract class GenresState extends Equatable {}

class GenresStateInitial extends GenresState {
  @override
  List<Object?> get props => [];
}

class GenresStateFetchs extends GenresState {
  final List<Genres> genres;
  GenresStateFetchs(this.genres);
  @override
  List<Object?> get props => [genres];
}
