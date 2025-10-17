import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoginRequestedEvent extends AuthEvent {
  final String username;
  final String password;

  LoginRequestedEvent(this.username, this.password);

  @override
  List<Object?> get props => [username, password];
}
