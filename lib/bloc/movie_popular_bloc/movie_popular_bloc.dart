import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magicview/entities/results.dart';
import 'package:magicview/utility/data_movie_popular_api.dart';
import 'package:equatable/equatable.dart';

part 'movie_popular_event.dart';
part 'movie_popular_state.dart';

class MoviePopularBloc extends Bloc<MoviePopularEvent, MoviePopularState> {
  MoviePopularBloc() : super(MoviePopularStateInitial()) {
    on<MoviePopularEvent>(onFetchMoviePopular);
  }

  FutureOr<void> onFetchMoviePopular(
      MoviePopularEvent event, Emitter<MoviePopularState> emit) async {
    final moviePopular = await DataMoviePopularApi.getAllMoviePopular();
    emit(MoviePopularStateFetchs(moviePopular));
  }
}
