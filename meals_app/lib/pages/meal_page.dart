import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';

class MealPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final arguments =
        ModalRoute.of(context).settings.arguments as Map<String, Object>;
    final Meal meal = arguments['meal'];

    return Scaffold(
      appBar: AppBar(
        title: Text("${meal.title}"),
      ),
      body: Column(
        children: <Widget>[
          Hero(
            tag: "mealHero${meal.id}",
            child: Image.network(
              meal.imageUrl,
              width: double.infinity,
              height: 250,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
    ;
  }
}
