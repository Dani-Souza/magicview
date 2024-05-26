import 'dart:async';
import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magicview/utility/create_image.dart';

part 'favorite_event_bloc.dart';
part 'favorite_state_bloc.dart';

class FavoriteBloc extends Bloc<FavoriteEventBloc, FavoriteStateBloc> {
  ImageCreate imageCreate;
  FavoriteBloc(this.imageCreate) : super(FavoriteLoadingState()) {
    on<FavoritoImageDefault>(_onDefaultImage);
    on<FavoriteCreateEvent>(_onCreateFavorite);
  }

  FutureOr<void> _onCreateFavorite(
      FavoriteCreateEvent event, Emitter<FavoriteStateBloc> emit) async {
    emit(FavoriteLoadingState());
    await Future.delayed(const Duration(seconds: 2));
    try {
      emit(FavoriteAddNickAndNumberState());
      //criar a aimage
      // var newImage = imageCreate.takePicture();
      // emit(FavoriteCreateImageSate(fileName: newImage.toString()));
    } catch (e) {
      print(e);
      //emit(FavoriteErrorState(message: "Falha ao tentar criar favorito"));
    }
  }

  FutureOr<void> _onDefaultImage(
      FavoritoImageDefault event, Emitter<FavoriteStateBloc> emit) async {
    emit(FavoriteDefaultImageState());
  }
}
