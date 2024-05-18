part of 'serie_popular_bloc.dart';

abstract class SeriePopularEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class SeriePopularEventFetchs extends SeriePopularEvent {
  final int page;
  final String language;

  SeriePopularEventFetchs(this.page, this.language);
  List<Object?> get props => [page, language];
}
