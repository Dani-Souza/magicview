import 'package:equatable/equatable.dart';
import 'package:magicview/adapter/sharePreferencesAdapter.dart';
import 'dart:async';
import 'package:magicview/entities/results.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magicview/reposistories/movie_popular_repository.dart';

part 'movie_genres_popular_event.dart';
part 'movie_genres_popular_state.dart';

class MovieGenresPopularBloc
    extends Bloc<MovieGenresPopularEvent, MovieGenresPopularState> {
  SharePrefrencesAdapter sharePrefrencesAdapter;
  MovieGenresPopularBloc(this.sharePrefrencesAdapter)
      : super(MovieGenresPopularStateLoading()) {
    on<MovieGenresPopularEventByIdLoaded>(_onGetByIdMoviePopular);
    on<MovieEventGenresMoreLoadById>(_onFetchMoreMOvieByGenresId);
  }

  FutureOr<void> _onGetByIdMoviePopular(MovieGenresPopularEventByIdLoaded event,
      Emitter<MovieGenresPopularState> emit) async {
    emit(MovieGenresPopularStateLoading());
    try {
      Map<String, dynamic> user = await sharePrefrencesAdapter.get("login");
      String userId = user["id"];

      final results = await MoviePopularRepository.getMoviePopularByGenresId(
          event.genresId, event.page, event.language, event.typeMovieOrTv);
      emit(MovieGenresPopularStateFetchs(
        results,
        event.genresId,
        event.page,
        userId,
      ));
    } catch (e) {
      emit(const MovieGenresPopularErrorState("error"));
    }
  }

  FutureOr<void> _onFetchMoreMOvieByGenresId(MovieEventGenresMoreLoadById event,
      Emitter<MovieGenresPopularState> emit) async {
    try {
      Map<String, dynamic> user = await sharePrefrencesAdapter.get("login");
      String userId = user["id"];

      final results = await MoviePopularRepository.getMoviePopularByGenresId(
          event.genresId, event.page, event.language, event.typeMovieOrTv);
      emit(MovieGenresPopularStateFetchs(
          results, event.genresId, event.page, userId));
    } catch (e) {
      emit(const MovieGenresPopularErrorState("error"));
    }
  }
}
