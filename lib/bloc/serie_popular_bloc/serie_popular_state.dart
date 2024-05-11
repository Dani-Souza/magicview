part of 'serie_popular_bloc.dart';

abstract class SeriePopularState extends Equatable {}

class SeriePopularStateInitial extends SeriePopularState {
  @override
  List<Object?> get props => [];
}

class SeriePopularStateFetchs extends SeriePopularState {
  final List<ResultsSeriePopular> resultSeriePopular;
  SeriePopularStateFetchs(this.resultSeriePopular);

  @override
  List<Object?> get props => [resultSeriePopular];
}
