import 'package:authorization_app/core/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:authorization_app/features/auth/domain/bloc/sign_in_bloc.dart';
import 'package:authorization_app/features/home/ui/home_page.dart';
import 'package:authorization_app/features/auth/data/repository/user.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rive/rive.dart';
import 'package:flutter/services.dart';
import 'package:authorization_app/core/widgets/rive_animated_widget.dart';

class RiveLoginPage extends StatefulWidget {
  RiveLoginPage({super.key});

  @override
  State<RiveLoginPage> createState() => _RiveLoginPageState();
}

class _RiveLoginPageState extends State<RiveLoginPage> {
  StateMachineController? animatedController;

  SMIInput<bool>? isChecking;
  SMIInput<bool>? isHandsUp;
  SMIInput<bool>? trigSucces;
  SMIInput<bool>? trigFail;

  final TextEditingController _loginController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
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
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25)),
                ),
                backgroundColor: Color(0xff9b2059),
                content: Center(
                    child: Text(
                  loc.titleIncorrect,
                  style: GoogleFonts.jetBrainsMono(
                    color: Colors.black87,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ))),
          );
        }
      },
      child: Scaffold(
        backgroundColor: Color(0xffD6E2EA),
        appBar: AppBar(
          backgroundColor: Color(0xff9b2059),
          title: Center(
            child: Text(
              loc.titleAuth,
              style: GoogleFonts.jetBrainsMono(
                color: Colors.black87,
                fontSize: 25,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        body: SizedBox(
          width: size.width,
          height: size.height,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: size.width,
                  height: 200,
                  child: RiveAnimation.asset(
                    'assets/rive/animated_login_character.riv',
                    stateMachines: ['Login Machine'],
                    onInit: (artboard) {
                      animatedController = StateMachineController.fromArtboard(
                          artboard, 'Login Machine');
                      if (animatedController == null) return;

                      artboard.addController(animatedController!);
                      isChecking = animatedController?.findInput('isChecking');
                      isHandsUp = animatedController?.findInput('isHandsUp');
                      trigSucces = animatedController?.findInput('trigSucces');
                      trigFail = animatedController?.findInput('trigFail');
                    },
                  ),
                  // RiveAnimatedWidget(
                  //   isChecking: isChecking,
                  //   isHandsUp: isHandsUp,
                  //   trigSucces: trigSucces,
                  //   trigFail: trigFail,
                  // ),
                ),
                const SizedBox(height: 10),
                TextField(
                  onChanged: (value) {
                    if (isHandsUp != null) {
                      isHandsUp!.change(false);
                    }

                    if (isChecking == null) return;

                    isChecking!.change(true);
                  },
                  controller: _loginController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white24,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      borderSide: BorderSide(color: Colors.black, width: 2),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      borderSide:
                          BorderSide(color: Color(0xff9b2059), width: 2),
                    ),
                    labelText: loc.titleLogin,
                    labelStyle:
                        GoogleFonts.jetBrainsMono(color: Color(0xff9b2059)),
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  onChanged: (value) {
                    if (isChecking != null) {
                      isChecking!.change(false);
                    }

                    if (isHandsUp == null) return;

                    isHandsUp!.change(true);
                  },
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white24,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      borderSide: BorderSide(color: Colors.black87, width: 2),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      borderSide:
                          BorderSide(color: Color(0xff9b2059), width: 2),
                    ),
                    labelText: loc.titlePassword,
                    labelStyle:
                        GoogleFonts.jetBrainsMono(color: Color(0xff9b2059)),
                  ),
                ),
                SizedBox(height: 20),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    fixedSize: Size(120, 50),
                    backgroundColor: Color(0xff9b2059),
                    foregroundColor: Colors.black87,
                    side: BorderSide(
                      color: Colors.black87,
                      width: 2,
                    ),
                  ),
                  onPressed: () {
                    final login = _loginController.text;
                    final password = _passwordController.text;
                    context
                        .read<SignInBloc>()
                        .add(SignInLogin(login, password));
                  },
                  child: Text(
                    loc.titleLoginButton,
                    style: GoogleFonts.jetBrainsMono(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
