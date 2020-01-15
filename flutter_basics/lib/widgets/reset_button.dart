import 'package:flutter/material.dart';

class ResetButton extends StatelessWidget {
  final Function onPress;

  ResetButton(this.onPress);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FlatButton(
        child: Text('Reset'),
        onPressed: onPress,
      ),
    );
  }
}
