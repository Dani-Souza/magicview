import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magicview/adapter/sharePreferencesAdapter.dart';
import 'package:magicview/reposistories/remote/favorite_repositoy_impl.dart';
import 'package:magicview/utility/constants.dart';

part 'login_user_event_bloc.dart';
part 'login_user_state_bloc.dart';

class LoginUserBloc extends Bloc<LoginUserEventBloc, LoginUserStateBloc> {
  final FavoriteRespositoryImpl favoriteRespositoryImpl;
  final SharePrefrencesAdapter sharePrefrencesAdapter;
  LoginUserBloc(this.favoriteRespositoryImpl, this.sharePrefrencesAdapter)
      : super(LoginUserInitializeState()) {
    on<LoginUserEventSubmit>(_onSubmitLogin);
  }

  FutureOr<void> _onSubmitLogin(
      LoginUserEventSubmit event, Emitter<LoginUserStateBloc> emit) async {
    emit(LoginUserLoadingState());
    try {
      final login = await favoriteRespositoryImpl.login(
          url: Constants.URL_API_FAVORITE,
          endPoint: "auth/login",
          body: {'email': event.email, "password": event.password});
      print(login['user']);
      await sharePrefrencesAdapter.set("login", login['user']);
      await sharePrefrencesAdapter.saveToken(login['token']);
      emit(LoginUserSuccessState(hasLoged: true));
    } on Exception catch (e) {
      emit(LoginUserErrorState(message: e.toString()));
    }
  }
}
