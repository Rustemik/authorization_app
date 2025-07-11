import 'package:authorization_app/core/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:authorization_app/features/auth/domain/bloc/sign_in_bloc.dart';
import 'package:authorization_app/features/home/ui/home_page.dart';
import 'package:authorization_app/features/auth/data/repository/user.dart';

class SignInPage extends StatelessWidget {
  final TextEditingController _loginController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    var loc = AppLocalizations.of(context)!;
    return BlocListener<SignInBloc, SignInState>(
      listener: (context, state) {
        if (state is UserAuthenticated) {
          final user = User(login: state.login, password: state.login);
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
                builder: (context) => HomePage(
                      login: user,
                    )),
          );
        } else if (state is UserUnAuthenticated) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(loc.titleIncorrect)));
        }
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Center(
            child: Text(
              loc.titleAuth,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextField(
                  controller: _loginController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    labelText: loc.titleLogin,
                  ),
                ),
                SizedBox(height: 40),
                TextField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    labelText: loc.titlePassword,
                  ),
                  obscureText: true,
                ),
                SizedBox(height: 40),
                OutlinedButton(
                  onPressed: () {
                    final login = _loginController.text;
                    final password = _passwordController.text;
                    context
                        .read<SignInBloc>()
                        .add(SignInLogin(login, password));
                  },
                  child: Text(loc.titleLoginButton),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
