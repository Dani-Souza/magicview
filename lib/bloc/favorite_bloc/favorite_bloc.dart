import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magicview/entities/favorite_movie.dart';
import 'package:magicview/entities/screen_arguments.dart';
import 'package:magicview/reposistories/local/favorite_repository.dart';
import 'package:magicview/utility/create_image.dart';

part 'favorite_event_bloc.dart';
part 'favorite_state_bloc.dart';

class FavoriteBloc extends Bloc<FavoriteEventBloc, FavoriteStateBloc> {
  ImageCreate imageCreate;
  FavoriteRepository favoriteRepository;

  FavoriteBloc(this.imageCreate, this.favoriteRepository)
      : super(FavoriteInitializeState()) {
    on<FavoriteShowImageSaved>(_onFavoritoSaved);
    on<FavoriteCreateEvent>(_onCreateFavorite);
  }

  FutureOr<void> _onCreateFavorite(
      FavoriteCreateEvent event, Emitter<FavoriteStateBloc> emit) async {
    emit(FavoriteLoadingState());

    await Future.delayed(const Duration(seconds: 2));
    try {
      emit(FavoriteAddNickAndNumberState());
      await Future.delayed(const Duration(seconds: 2));
      //criar a aimage

      //verificar se já exisite o favorito

      var newImage = await imageCreate.takePicture(event.genKey);
      emit(FavoriteCreateImageSate(fileName: newImage.toString()));

      FavoriteMovie favoritoMovie = FavoriteMovie(
          event.screenArguments.id,
          event.screenArguments.popularity,
          event.screenArguments.title,
          newImage,
          event.screenArguments.posterPath,
          event.screenArguments.voteAverage,
          event.screenArguments.voteCount);
      await favoriteRepository.addOrUpdateFavorite(favoritoMovie);
    } catch (e) {
      print(e);
      //emit(FavoriteErrorState(message: "Falha ao tentar criar favorito"));
    }
  }

  FutureOr<void> _onFavoritoSaved(
      FavoriteShowImageSaved event, Emitter<FavoriteStateBloc> emit) async {
    try {
      emit(FavoriteInitializeState());
      final favoriteMovie = await favoriteRepository.getByIdFavorite(event.id);
      if (favoriteMovie!.id > 0) {
        emit(FavoriteCreateImageSate(fileName: favoriteMovie!.postPathLocal));
      } else {
        emit(FavoriteInitializeState());
      }
    } catch (e) {
      print(e);
    }
  }
}
