import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  final void Function() startQuiz;

  const StartScreen(this.startQuiz, {super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 300,
            color: const Color.fromARGB(150, 255, 255, 255),
          ),
          const SizedBox(height: 80),
          Text(
            'Learn Flutter the fun way!',
            style: GoogleFonts.lato(
                  fontSize: 24,
                  color: const Color.fromARGB(255, 214, 162, 208),
                  fontWeight: FontWeight.bold
                )
          ),
          const SizedBox(height: 30),
          OutlinedButton.icon
          (   icon: const Icon(Icons.arrow_right_alt),
              onPressed: startQuiz,
              style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
              label: const Text('Start Quiz'))
        ],
      ),
    );
  }
}
