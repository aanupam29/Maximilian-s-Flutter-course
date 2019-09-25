import 'package:flutter/material.dart';
import 'package:meals_app/pages/home_page.dart';
import 'package:meals_app/pages/meal_page.dart';
import 'package:meals_app/pages/meals_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meals app',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        accentColor: Colors.yellow[600],
        fontFamily: 'Raleway',
        canvasColor: Colors.indigo[50],
      ),
      home: HomePage(),
      routes: {
        '/home': (context) => HomePage(),
        '/meals': (context) => MealsPage(),
        '/meal': (context) => MealPage(),
      },
    );
  }
}
