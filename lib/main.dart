import 'package:authorization_app/features/rive_auth/ui/rive_login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:authorization_app/features/auth/domain/bloc/sign_in_bloc.dart';
import 'package:authorization_app/features/auth/data/repository/users_repository.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:authorization_app/core/l10n/app_localizations.dart';
import 'package:authorization_app/features/auth/ui/sign_in_page.dart';

void main() {
  runApp(MultiBlocProvider(providers: [
    BlocProvider(
      create: (context) => SignInBloc(UsersRepository()),
    ),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Authorization App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'),
        Locale('ru'),
      ],
      home: RiveLoginPage(), //SignInPage(),
    );
  }
}
