import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:magicview/entities/genres.dart';
import 'package:magicview/reposistories/genres_respository.dart';

part "genres_event_bloc.dart";
part "genres_state_bloc.dart";

class GenresBloc extends Bloc<GenresEvent, GenresState> {
  final GenresRepository _genresRepository;
  GenresBloc(this._genresRepository) : super(GenresLoadingState()) {
    on<GenresEventSubmit>(_onFetchGenres);
  }

  FutureOr<void> _onFetchGenres(
      GenresEventSubmit event, Emitter<GenresState> emit) async {
    emit(GenresLoadingState());
    try {
      final genresResult =
          await _genresRepository.getMovieGenres('pt', event.typeMovieOrSerie);
      emit(GenresLoadedState(genresResult));
    } catch (e) {
      emit(GenresErrorState(e.toString()));
    }
  }
}
