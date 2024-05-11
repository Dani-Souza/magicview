part of 'serie_popular_bloc.dart';

abstract class SeriePopularEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class SeriePopularEventInitial extends SeriePopularEvent {}

class SeriePopularEventFetchs extends SeriePopularEvent {}
