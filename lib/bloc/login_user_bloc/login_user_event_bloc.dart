part of 'login_user_bloc.dart';

abstract class LoginUserEventBloc extends Equatable {}

class LoginUserEventSubmit extends LoginUserEventBloc {
  final String email;
  final String password;

  LoginUserEventSubmit({required this.email, required this.password});

  @override
  List<Object?> get props => [email, password];
}
