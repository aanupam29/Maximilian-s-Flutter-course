import 'package:flutter/material.dart';
import 'package:flutter_basics/classes/Question.dart';
import 'package:flutter_basics/widgets/answer.dart';

class Answers extends StatelessWidget {
  final Function onPressAnswerButton;
  final List<Question> questions;
  final int questionIndex;

  Answers(this.questions, this.questionIndex, this.onPressAnswerButton);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: this
          .questions[questionIndex]
          .answers
          .map(
            (answer) => Answer(
              answer,
              () {
                this.onPressAnswerButton(answer: answer);
              },
            ),
          )
          .toList(),
    );
  }
}
