import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magicview/entities/results_serie_popular.dart';
import 'package:magicview/reposistories/series_popular_repository.dart';

part 'serie_popular_event.dart';
part 'serie_popular_state.dart';

class SeriePopularBloc extends Bloc<SeriePopularEvent, SeriePopularState> {
  SeriePopularBloc() : super(SeriePopularStateLoading()) {
    on<SeriePopularEventFetchs>(_onFetchSeriePopular);
  }

  FutureOr<void> _onFetchSeriePopular(
      SeriePopularEventFetchs event, Emitter<SeriePopularState> emit) async {
    emit(SeriePopularStateLoading());
    try {
      final seriePopular = await SeriePopularRepository.getSeriePopular(
          event.page, event.language);
      emit(SeriePopularStateLoaded(seriePopular));
    } catch (e) {
      emit(SeriePopularStateError("Erro 404"));
    }
  }
}
