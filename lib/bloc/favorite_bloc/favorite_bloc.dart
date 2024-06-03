import 'dart:async';
import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magicview/adapter/sharePreferencesAdapter.dart';
import 'package:magicview/entities/favorite_movie.dart';
import 'package:magicview/entities/screen_arguments.dart';
import 'package:magicview/reposistories/local/favorite_local_repository.dart';
import 'package:magicview/reposistories/remote/favorite_repositoy_impl.dart';
import 'package:magicview/utility/constants.dart';
import 'package:magicview/utility/create_image.dart';

part 'favorite_event_bloc.dart';
part 'favorite_state_bloc.dart';

class FavoriteBloc extends Bloc<FavoriteEventBloc, FavoriteStateBloc> {
  ImageCreate imageCreate;
  FavoriteLocalRepository favoriteLocalRepository;
  FavoriteRespositoryImpl favoriteRespositoryImpl;
  SharePrefrencesAdapter sharePrefrencesAdapter;

  FavoriteBloc(this.imageCreate, this.favoriteLocalRepository,
      this.favoriteRespositoryImpl, this.sharePrefrencesAdapter)
      : super(FavoriteInitializeState()) {
    on<FavoriteShowImageSaved>(_onFavoritoSaved);
    on<FavoriteCreateEvent>(_onCreateFavorite);
  }

  FutureOr<void> _onCreateFavorite(
      FavoriteCreateEvent event, Emitter<FavoriteStateBloc> emit) async {
    emit(FavoriteLoadingState());

    await Future.delayed(const Duration(seconds: 2));

    try {
      Map<String, dynamic> user = await sharePrefrencesAdapter.get("login");
      var nick = user["nick"];
      String id = user["id"];

      var token = await sharePrefrencesAdapter.getToken();
      int count = await sharePrefrencesAdapter.getCountFavorite(id) + 1;
      await sharePrefrencesAdapter.addCountFavorite(id, count);

      emit(FavoriteAddNickAndNumberState(numberFavorite: count, nick: nick));
      await Future.delayed(const Duration(seconds: 2));

      var newImage = await imageCreate.takePicture(event.genKey);
      var fileUpload = File(newImage);
      emit(FavoriteUploadingState());
      await favoriteRespositoryImpl.upload(
          url: Constants.URL_API_FAVORITE,
          endPoint: "upload/single",
          headers: {
            'Authorization': 'Bearer $token',
            'Content-type': 'multipart/form-data',
            "Accept": "*/*",
          },
          fileName: fileUpload);

      await Future.delayed(const Duration(seconds: 2));

      emit(FavoriteCreateImageSate(fileName: newImage.toString()));

      FavoriteMovie favoritoMovie = FavoriteMovie(
          event.screenArguments.id,
          event.screenArguments.userId,
          event.screenArguments.popularity,
          event.screenArguments.title!,
          event.screenArguments.overview!,
          newImage,
          event.screenArguments.posterPath,
          event.screenArguments.voteAverage,
          event.screenArguments.voteCount);
      await favoriteLocalRepository.addOrUpdateFavorite(favoritoMovie);
    } catch (e) {
      print(e);
      //emit(FavoriteErrorState(message: "Falha ao tentar criar favorito"));
    }
  }

  FutureOr<void> _onFavoritoSaved(
      FavoriteShowImageSaved event, Emitter<FavoriteStateBloc> emit) async {
    try {
      emit(FavoriteInitializeState());
      final favoriteMovie = await favoriteLocalRepository.getByIdAndUserId(
          event.id, event.userId);
      if (favoriteMovie!.id > 0) {
        emit(FavoriteCreateImageSate(fileName: favoriteMovie.postPathLocal));
      } else {
        emit(FavoriteInitializeState());
      }
    } catch (e) {
      print(e);
    }
  }
}
