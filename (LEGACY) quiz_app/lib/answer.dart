import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final Function onPress;
  final String answer;

  Answer({this.onPress, this.answer});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(10),
      child: RaisedButton(
        color: Colors.blue,
        child: Text(
          answer,
          style: TextStyle(color: Colors.white),
        ),
        onPressed: onPress,
      ),
    );
  }
}
