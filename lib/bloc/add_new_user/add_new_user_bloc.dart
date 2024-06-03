import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magicview/adapter/sharePreferencesAdapter.dart';
import 'package:magicview/reposistories/remote/favorite_repositoy_impl.dart';
import 'package:magicview/utility/constants.dart';

part 'add_new_user_event_bloc.dart';
part 'add_new_user_state_bloc.dart';

class AddNewUserBloc extends Bloc<AddNewUserEventBloc, AddNewUserStateBloc> {
  final FavoriteRespositoryImpl favoriteRespositoryImpl;
  final SharePrefrencesAdapter sharePrefrencesAdapter;
  AddNewUserBloc(this.favoriteRespositoryImpl, this.sharePrefrencesAdapter)
      : super(AddUserInitialSate()) {
    on<AddNewUserSubmitEvent>(_onAddNewUser);
  }

  FutureOr<void> _onAddNewUser(
      AddNewUserSubmitEvent event, Emitter<AddNewUserStateBloc> emit) async {
    emit(AddNewUserLoading());
    try {
      final result = await favoriteRespositoryImpl
          .addUser(url: Constants.URL_API_FAVORITE, endPoint: 'auth', body: {
        'nick': event.nick,
        'email': event.email,
        'password': event.password,
      });

      await sharePrefrencesAdapter.set("user", result);
      emit(AddNewUserLoadedState(message: "Usuário Cadastrado com Sucesso !"));
    } on Exception catch (e) {
      emit(AddNewUserErrorState(message: e.toString()));
    }
  }
}
