import 'package:flutter/material.dart';
import 'package:quiz_app/question.dart';

void main() => runApp(MainPage());

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _questionIndex = 0;
  final List questions = [
    'What\'s your favorite color?',
    'What\'s your favorite animal?',
    'What\'s your favorite drink?',
  ];

  void _onAnswerSelected(BuildContext context) {
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
  }

  Widget _renderText() {
    String question = _questionIndex < questions.length
        ? questions[_questionIndex]
        : 'Question not found!';

    return Question(question);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: <Widget>[
            _renderText(),
            RaisedButton(
              child: Text('Change question!'),
              onPressed: () => _onAnswerSelected(context),
            )
          ],
        ),
        appBar: AppBar(
          title: Text('Quiz App'),
        ),
      ),
    );
  }
}
