part of 'add_new_user_bloc.dart';

abstract class AddNewUserStateBloc extends Equatable {}

class AddUserInitialSate extends AddNewUserStateBloc {
  @override
  List<Object?> get props => [];
}

class AddNewUserLoading extends AddNewUserStateBloc {
  @override
  List<Object?> get props => [];
}

class AddNewUserLoadedState extends AddNewUserStateBloc {
  final String message;

  AddNewUserLoadedState({required this.message});
  @override
  List<Object?> get props => [message];
}

class AddNewUserErrorState extends AddNewUserStateBloc {
  final String message;

  AddNewUserErrorState({required this.message});
  @override
  List<Object?> get props => [message];
}
