import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:authorization_app/repository/users_repository.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final UsersRepository usersRepository;

  SignInBloc(this.usersRepository) : super(SignInInitial()) {
    on<SignInLogin>(_onSignInLogin);
    on<SignInExitLogin>(_onSignInExitLogin);
  }

  Future<void> _onSignInLogin(
      SignInLogin event, Emitter<SignInState> emit) async {
    try {
      final user = usersRepository.authenticate(event.login, event.password);
      emit(UserAuthenticated(user!.login));
    } catch (e) {
      emit(UserUnAuthenticated());
    }
  }

  void _onSignInExitLogin(SignInExitLogin event, Emitter<SignInState> emit) {
    emit(UserUnAuthenticated());
  }
}
