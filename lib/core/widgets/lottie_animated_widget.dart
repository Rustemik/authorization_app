import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HelloAnimated extends StatelessWidget {
  const HelloAnimated({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset(
        'assets/lottie/hello_animation.json',
        width: 250,
        height: 250,
      ),
    );
  }
}
