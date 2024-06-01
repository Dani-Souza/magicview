part of 'get_user_bloc.dart';

abstract class GetUserStateBloc extends Equatable {}

class GetUserLoadingState extends GetUserStateBloc {
  @override
  List<Object?> get props => [];
}

class GetUserLoadedState extends GetUserStateBloc {
  final List<User> user;

  GetUserLoadedState({required this.user});

  @override
  List<Object?> get props => [];
}

class GetUserErrorState extends GetUserStateBloc {
  final String message;

  GetUserErrorState({required this.message});

  @override
  List<Object?> get props => [message];
}
