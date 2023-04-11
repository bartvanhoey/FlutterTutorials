import 'package:flutter/material.dart';import 'package:flutter_complete_guide/quiz.dart';
import 'package:flutter_complete_guide/result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  var _totalScore = 0;

  var _questions = [
    {
      'questionText': 'What\'s your favorite color?',
      'answers': [
        {'text': 'Red', 'score': 10},
        {'text': 'Green', 'score': 7},
        {'text': 'Yellow', 'score': 5},
        {'text': 'Black', 'score': 3}
      ]
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': [
        {'text': 'Cow', 'score': 10},
        {'text': 'Dog', 'score': 6},
        {'text': 'Frog', 'score': 4},
        {'text': 'Cat', 'score': 2}
      ]
    },
    {
      'questionText': 'Who\'s your favorite instructor?',
      'answers': [
        {'text': 'Max', 'score': 7},
        {'text': 'John', 'score': 4},
        {'text': 'Maria', 'score': 2},
        {'text': 'Frank', 'score': 6}
      ]
    },
  ];

  void _answerQuestion(int score) {
    _totalScore += score;
    if (_questionIndex < _questions.length) {
      setState(() {
        _questionIndex = _questionIndex + 1;
        print(_questionIndex);
      });
    } else {
      print('No more questions');
    }
  }

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('MyFirstApp')),
        body: _questionIndex < _questions.length
            ? Quiz(
                questions: _questions,
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex)
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
