import 'package:flutter/material.dart';

void main() => runApp(MainPage());

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int questionIndex = 0;

  void _onAnswerSelected(BuildContext context) {
    setState(() {
      questionIndex = questionIndex + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    var questions = [
      'What\'s your favorite color?',
      'What\'s your favorite animal?',
      'What\'s your favorite drink?',
    ];

    Widget _renderText() {
      return questionIndex < questions.length
          ? Text(questions[questionIndex])
          : Text('Question not found!');
    }

    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: <Widget>[
            Center(
              child: _renderText(),
            ),
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
