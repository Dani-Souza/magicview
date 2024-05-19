part of "genres_bloc.dart";

abstract class GenresEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GenresEventLoaded extends GenresEvent {}
