// flutter
import 'package:flutter/material.dart';

// custom
import 'package:flutter_basics/classes/Question.dart';
import 'package:flutter_basics/widgets/answer.dart';

void main() => runApp(BasicsApp());

class BasicsApp extends StatefulWidget {
  @override
  _BasicsAppState createState() => _BasicsAppState();
}

class _BasicsAppState extends State<BasicsApp> {
  final List<Question> questions = [
    Question('What\'s your favorite color?', ['Blue', 'Red', 'Green']),
    Question('What\'s your favorite meal?', ['Pizza', 'Meat', 'Hamburger']),
    Question('What\'s your favorite animal?', ['Dog', 'Cat', 'Horse'])
  ];

  int questionIndex = 0;

  List<String> answers = [];

  void _onPressAnswerButton({String answer}) {
    setState(() {
      questionIndex++;
      this.answers.add(answer);
    });
    print(answer);
  }

  String _getHeaderText() {
    print(this.questionIndex);
    return questionIndex < this.questions.length
        ? this.questions[this.questionIndex].question
        : 'Your Answers';
  }

  Widget _renderResetButton() {
    return questionIndex >= this.questions.length
        ? Container(
            child: FlatButton(
              child: Text('Reset'),
              onPressed: () {
                setState(() {
                  questionIndex = 0;
                  answers = [];
                });
              },
            ),
          )
        : Container();
  }

  Widget _getAnswersOrAnswered() {
    return questionIndex < this.questions.length
        ? Column(
            children: this
                .questions[questionIndex]
                .answers
                .map(
                  (answer) => Answer(
                    answer,
                    () {
                      this._onPressAnswerButton(answer: answer);
                    },
                  ),
                )
                .toList(),
          )
        : Column(
            children: this.answers.map((answer) => Text(answer)).toList(),
          );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
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
