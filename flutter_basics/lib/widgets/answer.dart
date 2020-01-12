import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final Function onPress;
  final String text;

  Answer(this.text, this.onPress);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: RaisedButton(
        child: Text(text),
        onPressed: onPress,
      ),
    );
  }
}
