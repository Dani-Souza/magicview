part of 'add_new_user_bloc.dart';

abstract class AddNewUserEventBloc extends Equatable {}

class AddNewUserSubmitEvent extends AddNewUserEventBloc {
  final String email;
  final String password;
  final String nick;

  AddNewUserSubmitEvent(
      {required this.email, required this.password, required this.nick});

  @override
  List<Object?> get props => [];
}
