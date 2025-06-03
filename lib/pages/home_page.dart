import 'package:authorization_app/pages/rive_login_page.dart';
import 'package:authorization_app/widgets/lottie_animated_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:authorization_app/bloc/sign_in_bloc.dart';
import 'package:authorization_app/repository/user.dart';
import 'package:authorization_app/pages/sign_in_page.dart';

class HomePage extends StatelessWidget {
  final User login;

  HomePage({required this.login});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffD6E2EA),
      appBar: AppBar(
        backgroundColor: Color(0xffffc300),
        title: Center(
          child: Text('Главная страница',
              style: TextStyle(color: Colors.black, fontSize: 25)),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Привет, ${login.login}!',
              style: TextStyle(fontSize: 40),
            ),
            SizedBox(height: 40),
            Center(
              child: HelloAnimated(),
            ),
            SizedBox(height: 40),
            ElevatedButton(
              style: OutlinedButton.styleFrom(
                fixedSize: Size(120, 50),
                backgroundColor: Color(0xffffc300),
                foregroundColor: Colors.black,
                side: BorderSide(
                  color: Colors.black,
                  width: 2,
                ),
              ),
              onPressed: () {
                context.read<SignInBloc>().add(SignInExitLogin());
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => BlocProvider.value(
                      value: context.read<SignInBloc>(),
                      child: RiveLoginPage(), //SignInPage(),
                    ),
                  ),
                );
              },
              child: Text(
                'Выйти',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
