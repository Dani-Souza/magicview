part of "genres_bloc.dart";

abstract class GenresEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GenresEventSubmit extends GenresEvent {
  final String typeMovieOrSerie;

  GenresEventSubmit({required this.typeMovieOrSerie});
}
