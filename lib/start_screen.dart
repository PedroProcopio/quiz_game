import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.switchScreen, {super.key});

  final void Function() switchScreen;

  Widget build(context) {
    return Column(
      children: [
        Image.asset(
          "assets/images/quiz-logo.png",
          width: 300,
          color: const Color.fromARGB(150, 255, 255, 255),
        ),
        const SizedBox(
          height: 80,
        ),
        const Text(
          "Learn Flutter the Fun Way",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        const SizedBox(
          height: 20,
        ),
        OutlinedButton.icon(
            icon: const Text(
              "->",
              style: TextStyle(color: Colors.white),
            ),
            label: const Text(
              "Start Now",
              style: TextStyle(color: Colors.white),
            ),
            onPressed: switchScreen),
      ],
      mainAxisSize: MainAxisSize.min,
    );
  }
}
