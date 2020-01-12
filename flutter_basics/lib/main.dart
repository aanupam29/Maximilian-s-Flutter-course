// flutter
import 'package:flutter/material.dart';

// custom
import 'package:flutter_basics/classes/Question.dart';
import 'package:flutter_basics/widgets/answers.dart';
import 'package:flutter_basics/widgets/reset_button.dart';
import 'package:flutter_basics/widgets/selected_answers.dart';

void main() => runApp(BasicsApp());

class BasicsApp extends StatefulWidget {
  @override
  _BasicsAppState createState() => _BasicsAppState();
}

class _BasicsAppState extends State<BasicsApp> {
  final List<Question> questions = [
    Question('What\'s your favorite color?',
        ['Blue', 'Red', 'Green', 'Pink', 'Yellow']),
    Question('What\'s your favorite meal?',
        ['Pizza', 'Meat', 'Hamburger', 'Rice with Meat']),
    Question('What\'s your favorite animal?', ['Dog', 'Cat', 'Horse'])
  ];

  int questionIndex = 0;

  List<String> answers = [];

  void _onPressAnswerButton({String answer}) {
    setState(() {
      questionIndex++;
      this.answers.add(answer);
    });
  }

  void _onResetApp() {
    setState(() {
      questionIndex = 0;
      answers = [];
    });
  }

  String _getHeaderText() {
    return questionIndex < this.questions.length
        ? this.questions[this.questionIndex].question
        : 'Your Answers';
  }

  Widget _renderResetButton() {
    return questionIndex >= this.questions.length
        ? ResetButton(this._onResetApp)
        : Container();
  }

  Widget _getAnswersOrAnswered() {
    return questionIndex < this.questions.length
        ? Answers(questions, questionIndex, _onPressAnswerButton)
        : SelectedAnswers(answers, questions);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter Basics'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Container(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      this._getHeaderText(),
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    this._getAnswersOrAnswered()
                  ],
                ),
              ),
            ),
            this._renderResetButton()
          ],
        ),
      ),
    );
  }
}
