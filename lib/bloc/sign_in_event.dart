part of 'sign_in_bloc.dart';

@immutable
sealed class SignInEvent {}

class SignInLogin extends SignInEvent {
  final String login;
  final String password;

  SignInLogin(this.login, this.password);
}

class SignInExitLogin extends SignInEvent {}
