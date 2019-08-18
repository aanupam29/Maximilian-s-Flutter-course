import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final String text;

  Header({this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Text(
        text,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      alignment: Alignment(0, 0),
    );
  }
}
