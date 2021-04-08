import 'package:flutter/material.dart';
import 'package:flutter_hello_world/result.dart';
import './quiz.dart';

void main() {
  runApp(MyApp());
}

// ignore: must_be_immutable
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}
//comm   новая ветка  part2

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': "What's your favourite color?",
      'answers': [
        {'text': "Black", 'score': 10},
        {'text': "Red", 'score': 5},
        {'text': 'Green', 'score': 3},
        {'text': 'White', 'score': 1},
      ]
    },
    {
      'questionText': "What's your favourite animal?",
      'answers': [
        {'text': "Rabbit", 'score': 3},
        {'text': "Snake", 'score': 11},
        {'text': 'Elephant', 'score': 5},
        {'text': 'Lion', 'score': 9},
      ]
    },
    {
      'questionText': "Who is your favorite instructor?",
      'answers': [
        {'text': "Max", 'score': 1},
        {'text': "Max", 'score': 1},
        {'text': 'Max', 'score': 1},
        {'text': 'Max', 'score': 1},
      ]
    },
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState((  ) {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;

    if (_questionIndex < _questions.length) {
      print("We have more questions!");
    } else {
      print("We have no more qestions!");
    }

    setState(() {
      _questionIndex += 1;
      print(_questionIndex);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("This title"),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
