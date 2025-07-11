part of 'sign_in_bloc.dart';

@immutable
sealed class SignInState {}

final class SignInInitial extends SignInState {}

class UserAuthenticated extends SignInState {
  final String login;

  UserAuthenticated(this.login);
}

class UserUnAuthenticated extends SignInState {}
