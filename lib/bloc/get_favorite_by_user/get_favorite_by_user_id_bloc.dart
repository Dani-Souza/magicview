import 'dart:async';
import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magicview/adapter/sharePreferencesAdapter.dart';
import 'package:magicview/entities/favorite.dart';
import 'package:magicview/reposistories/remote/favorite_repositoy_impl.dart';
import 'package:magicview/utility/constants.dart';

part 'get_favorite_by_user_id_event_bloc.dart';
part 'get_favorite_by_user_id_state_bloc.dart';

class GetFavoriteByUserIdBloc
    extends Bloc<GetFavoriteByUserIdEventBloc, GetFavoriteByUserIdStateBloc> {
  final FavoriteRespositoryImpl favoriteRespositoryImpl;
  final SharePrefrencesAdapter sharePrefrencesAdapter;
  GetFavoriteByUserIdBloc(
      this.favoriteRespositoryImpl, this.sharePrefrencesAdapter)
      : super(GetFavoriteByIdUserLoadingState()) {
    on<FetchAllFavoriteByUserid>(_getFavoritoByUserId);
  }

  FutureOr<void> _getFavoritoByUserId(FetchAllFavoriteByUserid event,
      Emitter<GetFavoriteByUserIdStateBloc> emit) async {
    emit(GetFavoriteByIdUserLoadingState());
    try {
      var token = await sharePrefrencesAdapter.getToken();
      List<dynamic> result = await favoriteRespositoryImpl.getList(
        url: Constants.URL_API_FAVORITE,
        endPoint: 'file/user/${event.userId}',
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      var favorites = result.map((json) => Favorite.fromJson(json)).toList();

      // List<Favorite> favorites =
      //     decoded.map((item) => Favorite.fromJsom(item)).toList();
      emit(GetFavoriteByIdUserLoadadeState(favoriteList: favorites));
    } on Exception catch (e) {
      emit(GetFavoriteByIdUserErroState(message: e.toString()));
    }
  }
}
