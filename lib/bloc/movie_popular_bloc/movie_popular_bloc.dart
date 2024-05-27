import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magicview/entities/results.dart';
import 'package:magicview/reposistories/movie_popular_repository.dart';
import 'package:equatable/equatable.dart';

part 'movie_popular_event.dart';
part 'movie_popular_state.dart';

class MoviePopularBloc extends Bloc<MoviePopularEvent, MoviePopularState> {
  MoviePopularBloc() : super(MoviePopularLoadingState()) {
    on<MoviePopularEventLoaded>(_onFetchMoviePopular);
    on<MoviePopularEventMoreLoad>(_onFetchMoreMovie);
  }

  FutureOr<void> _onFetchMoviePopular(
      MoviePopularEventLoaded event, Emitter<MoviePopularState> emit) async {
    emit(MoviePopularLoadingState());
    try {
      final results = await MoviePopularRepository.getMoviePopular(
          event.page, event.langague);
      emit(MoviePopularFetchsState(results));
    } catch (e) {
      emit(MoviePopularErrorState("Erro ao Carregar Filmes"));
    }
  }

  FutureOr<void> _onFetchMoreMovie(
      MoviePopularEventMoreLoad event, Emitter<MoviePopularState> emit) async {
    try {
      final results = await MoviePopularRepository.getMoviePopular(
          event.page, event.langague);
      emit(MoviePopularFetchsState(results));
    } catch (e) {
      emit(MoviePopularErrorState("Erro ao Carregar Filmes"));
    }
  }
}
