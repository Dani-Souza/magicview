import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magicview/entities/results_serie_popular.dart';
import 'package:magicview/utility/data_serie_popular_api.dart';

part 'serie_popular_event.dart';
part 'serie_popular_state.dart';

class SeriePopularBloc extends Bloc<SeriePopularEvent, SeriePopularState> {
  SeriePopularBloc() : super(SeriePopularStateInitial()) {
    on<SeriePopularEvent>(_onFetchMoviePopular);
  }

  FutureOr<void> _onFetchMoviePopular(
      SeriePopularEvent event, Emitter<SeriePopularState> emit) async {
    final seriePopular = await DataSeriePopularApi.getAllSeriePopular();

    emit(SeriePopularStateFetchs(seriePopular));
  }
}
