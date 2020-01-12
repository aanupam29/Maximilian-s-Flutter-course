import 'package:flutter/material.dart';
import 'package:flutter_basics/classes/Question.dart';

class SelectedAnswers extends StatelessWidget {
  final List<String> answers;
  final List<Question> questions;

  SelectedAnswers(this.answers, this.questions);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: this.answers.map((answer) {
        int index = answers.indexOf(answer);

        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(questions[index].question),
            Text(
              ' ' + answer,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        );
      }).toList(),
    );
  }
}
