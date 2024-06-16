import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magicview/adapter/sharePreferencesAdapter.dart';
import 'package:magicview/entities/user.dart';
import 'package:magicview/reposistories/remote/favorite_repositoy_impl.dart';
import 'package:magicview/utility/constants.dart';

part 'get_user_event_bloc.dart';
part 'get_user_state_bloc.dart';

class GetUserBloc extends Bloc<GetUserEventBloc, GetUserStateBloc> {
  final FavoriteRespositoryImpl favoriteRespositoryImpl;
  final SharePrefrencesAdapter sharePrefrencesAdapter;
  GetUserBloc(this.favoriteRespositoryImpl, this.sharePrefrencesAdapter)
      : super(GetUserLoadingState()) {
    on<GetUserEvent>(_onGetUser);
  }

  FutureOr<void> _onGetUser(
      GetUserEvent event, Emitter<GetUserStateBloc> emit) async {
    emit(GetUserLoadingState());
    try {
      //Map<String, dynamic> user = await sharePrefrencesAdapter.get("login");

      var token = await sharePrefrencesAdapter.getToken();
      Map<String, dynamic> result = await favoriteRespositoryImpl.getUser(
        url: Constants.URL_API_FAVORITE,
        endPoint: 'auth',
        queryParament: {'pagenumber': '1'},
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );
      final List<dynamic> decoded = result['content'];
      var users = decoded.map((json) => User.fromJson(json)).toList();

      emit(GetUserLoadedState(user: users));
    } on Exception catch (e) {
      emit(GetUserErrorState(message: e.toString()));
    }
  }
}
