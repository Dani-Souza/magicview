part of 'serie_popular_bloc.dart';

abstract class SeriePopularState extends Equatable {}

class SeriePopularStateLoading extends SeriePopularState {
  @override
  List<Object?> get props => [];
}

class SeriePopularStateLoaded extends SeriePopularState {
  final List<Results> resultSeriePopular;
  SeriePopularStateLoaded(this.resultSeriePopular);

  @override
  List<Object?> get props => [resultSeriePopular];
}

class SeriePopularStateError extends SeriePopularState {
  final String error;

  SeriePopularStateError(this.error);

  @override
  List<Object?> get props => [error];
}
