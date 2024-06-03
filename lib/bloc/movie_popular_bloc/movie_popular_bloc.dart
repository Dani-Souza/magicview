import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magicview/adapter/sharePreferencesAdapter.dart';
import 'package:magicview/entities/results.dart';
import 'package:magicview/reposistories/movie_popular_repository.dart';
import 'package:equatable/equatable.dart';

part 'movie_popular_event.dart';
part 'movie_popular_state.dart';

class MoviePopularBloc extends Bloc<MoviePopularEvent, MoviePopularState> {
  SharePrefrencesAdapter sharePrefrencesAdapter;
  MoviePopularBloc(this.sharePrefrencesAdapter)
      : super(MoviePopularLoadingState()) {
    on<MoviePopularEventLoaded>(_onFetchMoviePopular);
    on<MoviePopularEventMoreLoad>(_onFetchMoreMovie);
  }

  FutureOr<void> _onFetchMoviePopular(
      MoviePopularEventLoaded event, Emitter<MoviePopularState> emit) async {
    emit(MoviePopularLoadingState());
    try {
      Map<String, dynamic> user = await sharePrefrencesAdapter.get("login");
      String userId = user["id"];

      print(userId);
      final results = await MoviePopularRepository.getMoviePopular(
          event.page, event.langague, event.typeMovieOrTv);
      emit(MoviePopularFetchsState(results, event.page, userId));
    } catch (e) {
      emit(MoviePopularErrorState("Erro ao Carregar Filmes"));
    }
  }

  FutureOr<void> _onFetchMoreMovie(
      MoviePopularEventMoreLoad event, Emitter<MoviePopularState> emit) async {
    try {
      Map<String, dynamic> user = await sharePrefrencesAdapter.get("login");
      String id = user["id"];

      final results = await MoviePopularRepository.getMoviePopular(
          event.page, event.langague, event.typeMovieOrTv);
      emit(MoviePopularFetchsState(results, event.page, id));
    } catch (e) {
      emit(MoviePopularErrorState("Erro ao Carregar Filmes"));
    }
  }
}
