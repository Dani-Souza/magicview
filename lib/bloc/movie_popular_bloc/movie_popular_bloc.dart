import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magicview/entities/results.dart';
import 'package:magicview/reposistories/movie_popular_repository.dart';
import 'package:equatable/equatable.dart';

part 'movie_popular_event.dart';
part 'movie_popular_state.dart';

class MoviePopularBloc extends Bloc<MoviePopularEvent, MoviePopularState> {
  MoviePopularBloc() : super(MoviePopularStateInitial()) {
    on<MoviePopularEvent>(_onFetchMoviePopular);
  }

  FutureOr<void> _onFetchMoviePopular(
      MoviePopularEvent event, Emitter<MoviePopularState> emit) async {
    final results = await MoviePopularRepository.getMoviePopular(1, 'pt');
    emit(MoviePopularStateFetchs(results));
  }
}
