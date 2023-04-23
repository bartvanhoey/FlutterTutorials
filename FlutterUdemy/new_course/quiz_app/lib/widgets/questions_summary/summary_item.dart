import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/widgets/questions_summary/question_identifier.dart';

class SummaryItem extends StatelessWidget {
  const SummaryItem(this.summaryDataItem, {super.key});

  final Map<String, Object> summaryDataItem;

  @override
  Widget build(BuildContext context) {
    final isCorrectAnswer =
        summaryDataItem['user_answer'] == summaryDataItem['correct_answer'];

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        QuestionIdentifier(
            isCorrectAnswer: isCorrectAnswer,
            questionIndex: summaryDataItem['question_index'] as int),
        const SizedBox(width: 20),
        Expanded(
          child: Column(
            children: [
              Text(
                summaryDataItem['question'] as String,
                style: GoogleFonts.lato(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 5),
              Text(
                summaryDataItem['user_answer'] as String,
                style:
                    const TextStyle(color: Color.fromARGB(255, 202, 171, 252)),
              ),
              const SizedBox(height: 5),
              Text(
                summaryDataItem['correct_answer'] as String,
                style:
                    const TextStyle(color: Color.fromARGB(255, 181, 254, 246)),
              )
            ],
          ),
        )
      ],
    );
  }
}
