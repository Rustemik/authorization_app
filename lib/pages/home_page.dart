import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:authorization_app/bloc/sign_in_bloc.dart';
import 'package:authorization_app/pages/sign_in_page.dart';
import 'package:authorization_app/repository/user.dart';

class HomePage extends StatelessWidget {
  final User login;

  HomePage({required this.login});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text('Главная страница'))),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Привет, ${login.login}!'),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                context.read<SignInBloc>().add(SignInExitLogin());
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => BlocProvider.value(
                      value: context.read<SignInBloc>(),
                      child: SignInPage(),
                    ),
                  ),
                );
              },
              child: Text('Выйти'),
            ),
          ],
        ),
      ),
    );
  }
}
