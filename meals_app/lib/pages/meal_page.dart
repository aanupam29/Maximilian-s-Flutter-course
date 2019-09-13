import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/widgets/how_to.dart';
import 'package:meals_app/widgets/ingredients_box.dart';

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
      body: SingleChildScrollView(
        padding: EdgeInsets.only(bottom: 20, top: 10),
        child: Column(
          children: <Widget>[
            Hero(
              tag: "mealHero${meal.id}",
              child: Image.network(
                meal.imageUrl,
                width: double.infinity,
                height: 300,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 30, bottom: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Ingredients',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  IngredientsBox(
                    ingredients: meal.ingredients,
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 30, bottom: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'How to do',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  HowTo(
                    steps: meal.steps,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
