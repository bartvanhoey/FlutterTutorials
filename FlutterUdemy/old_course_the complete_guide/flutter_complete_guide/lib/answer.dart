import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final Function _answerQuestion;
  final String _answerText;

  Answer(this._answerQuestion, this._answerText);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () => _answerQuestion(),
        child: Text(_answerText),
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.red),
            foregroundColor: MaterialStatePropertyAll(Colors.white)),
      ),
    );
  }
}

          

