import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String? id;
  final String? nick;
  final String? email;
  final String? password;

  const User({this.id, this.nick, this.email, this.password});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        id: json['id'],
        nick: json['nick'],
        email: json['email'],
        password: json['password']);
  }

  Map<String, dynamic> toJson() {
    return {
      'nick': nick,
      'email': email,
      'password': password,
    };
  }

  @override
  List<Object?> get props => [id, nick, email, password];
}
