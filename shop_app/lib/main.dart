import 'package:flutter/material.dart';
import 'package:shop_app/screens/MainScreen.dart';

void main() => runApp(ShopApp());

class ShopApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shop App',
      home: MainScreen(),
    );
  }
}
