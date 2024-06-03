import 'dart:async';
import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magicview/adapter/sharePreferencesAdapter.dart';
import 'package:magicview/entities/favorite_movie.dart';
import 'package:magicview/reposistories/local/favorite_local_repository.dart';
import 'package:magicview/utility/create_image.dart';

part 'get_favorite_event_bloc.dart';
part 'get_favorite_state_bloc.dart';

class GetFavoriteBloc extends Bloc<GetFavoriteEventBloc, GetFavoriteStateBloc> {
  FavoriteLocalRepository favoriteLocalRepository;
  SharePrefrencesAdapter sharePrefrencesAdapter;
  ImageCreate imageCreate;
  GetFavoriteBloc(this.favoriteLocalRepository, this.sharePrefrencesAdapter,
      this.imageCreate)
      : super(GetFavoriteLoandingStateLocalSavedBloc()) {
    on<GetFavoriteImageSaveLocal>(_onGetSaveImageLocal);
    on<FavoriteDeleteImageEvent>(_onDeleteImageFavorite);
  }

  FutureOr<void> _onGetSaveImageLocal(GetFavoriteImageSaveLocal event,
      Emitter<GetFavoriteStateBloc> emit) async {
    emit(GetFavoriteLoandingStateLocalSavedBloc());

    try {
      Map<String, dynamic> user = await sharePrefrencesAdapter.get("login");
      String userId = user["id"];

      final results = await favoriteLocalRepository.getAllFavorites(userId);
      emit(GetFavoriteLoandedStateLocalSavedBloc(results));
    } catch (e) {
      print(e);
    }
  }

  FutureOr<void> _onDeleteImageFavorite(FavoriteDeleteImageEvent event,
      Emitter<GetFavoriteStateBloc> emit) async {
    try {
      await favoriteLocalRepository.deleteFavorite(event.id, event.userId);
      imageCreate.deleteFile(File(event.fileName));
      final results =
          await favoriteLocalRepository.getAllFavorites(event.userId);
      emit(GetFavoriteLoandedStateLocalSavedBloc(results));
    } catch (e) {
      print(e);
    }
  }
}
