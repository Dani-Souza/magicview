import 'package:equatable/equatable.dart';
import 'dart:async';
import 'package:magicview/entities/results.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magicview/utility/data_movie_popular_api.dart';

part 'movie_genres_popular_event.dart';
part 'movie_genres_popular_state.dart';

class MovieGenresPopularBloc
    extends Bloc<MovieGenresPopularEvent, MovieGenresPopularState> {
  MovieGenresPopularBloc() : super(MovieGenresPopularStateInitial()) {
    on<MovieGenresPopularEventById>(_onGetByIdMoviePopular);
  }

  FutureOr<void> _onGetByIdMoviePopular(MovieGenresPopularEventById event,
      Emitter<MovieGenresPopularState> emit) async {
    final List<Results> resultList =
        await DataMoviePopularApi.getMoviePopularById(event.movieId);
    emit(MovieGenresPopularStateByID(event.movieId, resultList));
  }
}
