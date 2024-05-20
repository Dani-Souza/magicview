import 'package:equatable/equatable.dart';
import 'dart:async';
import 'package:magicview/entities/results.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magicview/reposistories/movie_popular_repository.dart';

part 'movie_genres_popular_event.dart';
part 'movie_genres_popular_state.dart';

class MovieGenresPopularBloc
    extends Bloc<MovieGenresPopularEvent, MovieGenresPopularState> {
  MovieGenresPopularBloc() : super(MovieGenresPopularStateLoading()) {
    on<MovieGenresPopularEventByIdLoaded>(_onGetByIdMoviePopular);
  }

  FutureOr<void> _onGetByIdMoviePopular(MovieGenresPopularEventByIdLoaded event,
      Emitter<MovieGenresPopularState> emit) async {
    emit(MovieGenresPopularStateLoading());
    try {
      final results = await MoviePopularRepository.getMoviePopularByGenresId(
          event.genresId, event.page, event.language);
      emit(MovieGenresPopularStateFetchs(results));
    } catch (e) {
      emit(const MovieGenresPopularErrorState("error"));
    }
  }
}
