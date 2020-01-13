import 'package:flutter/material.dart';

void main() => runApp(PersonalExpensesApp());

class PersonalExpensesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Personal Expenses'),
        ),
        body: Container(
          child: Center(
            child: Text('Personal Expenses'),
          ),
        ),
      ),
    );
  }
}
