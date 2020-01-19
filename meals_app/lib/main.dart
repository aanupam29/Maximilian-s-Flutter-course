import 'package:flutter/material.dart';
import 'package:meals_app/screens/categories-page.dart';

void main() => runApp(MealsApp());

class MealsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CategoriesPage(),
      title: 'Meals App',
    );
  }
}
