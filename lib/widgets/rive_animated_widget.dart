import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class RiveAnimatedWidget extends StatefulWidget {
  SMIInput<bool>? isChecking;
  SMIInput<bool>? isHandsUp;
  SMIInput<bool>? trigSucces;
  SMIInput<bool>? trigFail;
  RiveAnimatedWidget({
    Key? key,
    this.isChecking,
    this.isHandsUp,
    this.trigSucces,
    this.trigFail,
  }) : super(key: key);

  @override
  _RiveAnimatedWidgetState createState() => _RiveAnimatedWidgetState();
}

class _RiveAnimatedWidgetState extends State<RiveAnimatedWidget> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    StateMachineController? animatedController;

    return SizedBox(
      width: size.width,
      height: 200,
      child: RiveAnimation.asset(
        'assets/rive/animated_login_character.riv',
        stateMachines: ['Login Machine'],
        onInit: (artboard) {
          animatedController =
              StateMachineController.fromArtboard(artboard, 'Login Machine');
          if (animatedController == null) return;

          artboard.addController(animatedController!);
          widget.isChecking = animatedController?.findInput('isChecking');
          widget.isHandsUp = animatedController?.findInput('isHandsUp');
          widget.trigSucces = animatedController?.findInput('trigSucces');
          widget.trigFail = animatedController?.findInput('trigFail');
        },
      ),
    );
  }
}
