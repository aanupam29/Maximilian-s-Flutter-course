import 'package:flutter/material.dart';

void main() => runApp(BasicsApp());

class BasicsApp extends StatelessWidget {
  void onPressAnswerButton({String answer = 'answer'}) {
    print(answer);
  }

  @override
  Widget build(BuildContext context) {
    List<String> questions = [
      'What\'s your favorite color?',
      'What\'s your favorite meal?',
      'What\'s your favorite animal?'
    ];

    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter Basics'),
        ),
        body: Container(
            child: Column(
          children: <Widget>[
            Text('The question'),
            RaisedButton(
                child: Text('Answer 1'),
                onPressed: () {
                  onPressAnswerButton(answer: 'Answer 1');
                }),
            RaisedButton(
                child: Text('Answer 2'),
                onPressed: () {
                  onPressAnswerButton(answer: 'Answer 2');
                }),
            RaisedButton(
                child: Text('Answer 3'),
                onPressed: () {
                  onPressAnswerButton(answer: 'Answer 3');
                }),
          ],
        )),
      ),
    );
  }
}
