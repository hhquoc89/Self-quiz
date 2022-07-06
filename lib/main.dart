import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/result.dart';
import './question.dart';
import './answer.dart';
import './quiz.dart';
import './result.dart';

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
  final _questions = const [
    {
      'questionText': 'What\'s my favorite color?',
      'answers': [
        {'text': 'Black', 'score': 1},
        {'text': 'Red', 'score': 6},
        {'text': 'Blue', 'score': 9},
        {'text': 'White', 'score': 8}
      ],
    },
    {
      'questionText': 'What\'s my favorite animal?',
      'answers': [
        {'text': 'Rabbit', 'score': 3},
        {'text': 'Snake', 'score': 6},
        {'text': 'Elephant', 'score': 9},
        {'text': 'Lion', 'score': 8}
      ],
    },
    {
      'questionText': 'Who\'s my favorite singer?',
      'answers': [
        {'text': 'Son Tung MTP', 'score': 5},
        {'text': 'Jack', 'score': 6},
        {'text': 'Den Vau', 'score': 9},
        {'text': 'My Tam', 'score': 8}
      ],
    },
    {
      'questionText': 'What\'s my favorite game?',
      'answers': [
        {'text': 'League of Legend', 'score': 5},
        {'text': 'CS:GO', 'score': 6},
        {'text': 'Valorant', 'score': 9},
        {'text': 'PUBG', 'score': 8}
      ],
    }
  ];
  var _questionsIndex = 0;
  var _totalScore = 0;
  void _resetQuiz() {
    setState(() {
      _questionsIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore = _totalScore + score;

    setState(() {
      _questionsIndex = _questionsIndex + 1;
    });
    print(_questionsIndex);
    if (_questionsIndex < _questions.length) {
      print('We have more questions!!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My first App'),
        ),
        body: _questionsIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionsIndex: _questionsIndex,
                questions: _questions)
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
