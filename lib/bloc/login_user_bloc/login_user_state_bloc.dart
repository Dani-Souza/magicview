part of 'login_user_bloc.dart';

abstract class LoginUserStateBloc extends Equatable {}

class LoginUserInitializeState extends LoginUserStateBloc {
  @override
  List<Object?> get props => [];
}

class LoginUserLoadingState extends LoginUserStateBloc {
  @override
  List<Object?> get props => [];
}

class LoginUserSuccessState extends LoginUserStateBloc {
  final bool hasLoged;

  LoginUserSuccessState({required this.hasLoged});

  @override
  List<Object?> get props => [hasLoged];
}

class LoginUserErrorState extends LoginUserStateBloc {
  final String message;

  LoginUserErrorState({required this.message});

  @override
  List<Object?> get props => [];
}
