import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magicview/adapter/sharePreferencesAdapter.dart';
import 'package:magicview/entities/favorite.dart';
import 'package:magicview/reposistories/remote/favorite_repositoy_impl.dart';
import 'package:magicview/utility/constants.dart';

part 'get_my_favorite_event_bloc.dart';
part 'get_my_favorite_state_bloc.dart';

class GetMyFavoriteBloc
    extends Bloc<GetMyFavoriteEventBloc, GetMyFavoriteStateBloc> {
  final FavoriteRespositoryImpl favoriteRespositoryImpl;
  final SharePrefrencesAdapter sharePrefrencesAdapter;
  GetMyFavoriteBloc(this.favoriteRespositoryImpl, this.sharePrefrencesAdapter)
      : super(GetMyFavoriteStateLoadindBloc()) {
    on<FetchMyFavoriteEventBloc>(onGetMyFavorite);
  }

  FutureOr<void> onGetMyFavorite(FetchMyFavoriteEventBloc event,
      Emitter<GetMyFavoriteStateBloc> emit) async {
    emit(GetMyFavoriteStateLoadindBloc());
    try {
      var token = await sharePrefrencesAdapter.getToken();

      final result = await favoriteRespositoryImpl.getList(
        url: Constants.URL_API_FAVORITE,
        endPoint: "file/user",
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      var favorites = result.map((json) => Favorite.fromJson(json)).toList();
      emit(GetMyFavoriteStateLoadedBloc(favorite: favorites));
    } on Exception catch (e) {
      emit(GetMyFavoriteStateErrorBloc(message: e.toString()));
    }
  }
}
