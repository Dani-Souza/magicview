import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magicview/adapter/sharePreferencesAdapter.dart';
import 'package:magicview/entities/favorite_movie.dart';
import 'package:magicview/reposistories/local/favorite_local_repository.dart';

part 'get_favorite_event_bloc.dart';
part 'get_favorite_state_bloc.dart';

class GetFavoriteBloc extends Bloc<GetFavoriteEventBloc, GetFavoriteStateBloc> {
  FavoriteLocalRepository favoriteRepository;
  SharePrefrencesAdapter sharePrefrencesAdapter;
  GetFavoriteBloc(this.favoriteRepository, this.sharePrefrencesAdapter)
      : super(GetFavoriteLoandingStateLocalSavedBloc()) {
    on<GetFavoriteImageSaveLocal>(_onGetSaveImageLocal);
  }

  FutureOr<void> _onGetSaveImageLocal(GetFavoriteImageSaveLocal event,
      Emitter<GetFavoriteStateBloc> emit) async {
    emit(GetFavoriteLoandingStateLocalSavedBloc());

    try {
      Map<String, dynamic> user = await sharePrefrencesAdapter.get("login");
      String userId = user["id"];

      final results = await favoriteRepository.getAllFavorites(userId);
      emit(GetFavoriteLoandedStateLocalSavedBloc(results));
    } catch (e) {
      print(e);
    }
  }
}
