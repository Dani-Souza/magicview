part of "genres_bloc.dart";

abstract class GenresEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GenresEventInitial extends GenresEvent {}

class GenresEventFetchs extends GenresEvent {}
