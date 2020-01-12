import 'package:flutter/material.dart';
import 'package:shop_app/screens/home_page.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shop App',
      home: HomePage(),
    );
  }
}
