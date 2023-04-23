import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/widgets/answer_button.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key, required this.onSelectedAnswer});

  final void Function(String answer) onSelectedAnswer;

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];

    void answerQuestion(String selectedAnswer) {
      setState(() {
        currentQuestionIndex++;
        widget.onSelectedAnswer(selectedAnswer);
      });
    }

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(currentQuestion.text,
                textAlign: TextAlign.center,
                style: GoogleFonts.lato(
                    fontSize: 24,
                    color: const Color.fromARGB(255, 214, 162, 208),
                    fontWeight: FontWeight.bold)),
            const SizedBox(height: 30),
            ...currentQuestion.shuffledAnsers.map((answer) =>
                AnswerButton(answerText: answer, onTap: () => answerQuestion(answer)))
          ],
        ),
      ),
    );
  }
}
