// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';
import 'quiz.dart';
import 'result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;

  final _questions = const [
    {
      'questionText': 'What is your favourite color?',
      'answers': [
        {'text': 'Red', 'score': 10},
        {'text': 'Yellow', 'score': 7},
        {'text': 'Green', 'score': 8},
        {'text': 'Blue', 'score': 9}
      ]
    },
    {
      'questionText': 'What\'s your favourite animal?',
      'answers': [
        {'text': 'Lion', 'score': 20},
        {'text': 'Dog', 'score': 9},
        {'text': 'Cat', 'score': 15}
      ]
    },
    {
      'questionText': 'Who is your favourite person?',
      'answers': [
        {'text': 'K', 'score': 6},
        {'text': 'O', 'score': 4},
        {'text': 'M', 'score': 13}
      ]
    },
  ];

  void _resetQuiz(){
    setState(() {
      _questionIndex=0;
      _totalScore=0;
    });


  }

  var _totalScore = 0;

  void _answerQuestion(int score) {
    _totalScore = score + _totalScore;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('More questions dey.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('My First App'),
          ),
          body: _questionIndex < _questions.length
              ? Quiz(
                  answerQuestion: _answerQuestion,
                  questionIndex: _questionIndex,
                  questions: _questions,
                )
              : Result(_totalScore,_resetQuiz)),
    );
  }
}
