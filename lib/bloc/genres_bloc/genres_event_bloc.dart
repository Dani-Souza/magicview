part of "genres_bloc.dart";

abstract class GenresEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GenresEventLoaded extends GenresEvent {
  final String typeMovieOrSerie;

  GenresEventLoaded({required this.typeMovieOrSerie});
}
