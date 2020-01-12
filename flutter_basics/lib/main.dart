import 'package:flutter/material.dart';

void main() {
  runApp(BasicsApp());
}

class BasicsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter Basics'),
        ),
        body: Container(
          child: Center(
            child: Text('The flutter basics app'),
          ),
        ),
      ),
    );
  }
}
