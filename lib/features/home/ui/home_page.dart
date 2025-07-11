import 'package:authorization_app/core/l10n/app_localizations.dart';
import 'package:authorization_app/features/rive_auth/ui/rive_login_page.dart';
import 'package:authorization_app/core/widgets/lottie_animated_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:authorization_app/features/auth/domain/bloc/sign_in_bloc.dart';
import 'package:authorization_app/features/auth/data/repository/user.dart';
import 'package:authorization_app/features/auth/ui/sign_in_page.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  final User login;

  HomePage({required this.login});

  @override
  Widget build(BuildContext context) {
    var loc = AppLocalizations.of(context)!;
    return Scaffold(
      backgroundColor: Color(0xffD6E2EA),
      appBar: AppBar(
        backgroundColor: Color(0xffffc300),
        title: Center(
          child: Text(loc.titleHomePage,
              style: GoogleFonts.jetBrainsMono(
                color: Colors.black87,
                fontSize: 25,
                fontWeight: FontWeight.w600,
              )),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${loc.titleHello}, ${login.login}!',
              style: GoogleFonts.jetBrainsMono(
                fontSize: 40,
                fontWeight: FontWeight.w600,
              ),
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
                foregroundColor: Colors.black87,
                side: BorderSide(
                  color: Colors.black87,
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
                loc.titleLogoutButton,
                style: GoogleFonts.jetBrainsMono(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
