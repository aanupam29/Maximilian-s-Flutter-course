import 'package:flutter/material.dart';
import 'package:meals_app/models/Meal.dart';

class MealDetailScreen extends StatelessWidget {
  final Meal meal;

  MealDetailScreen(this.meal);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.meal.title),
      ),
      body: Column(
        children: [
          Container(
            height: 300,
            width: double.infinity,
            child: Image.network(
              this.meal.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            child: Text(
              'Ingredients',
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Colors.grey,
                ),
                borderRadius: BorderRadius.circular(10)),
            height: 200,
            width: 250,
            child: ListView.builder(
                itemBuilder: (BuildContext _, int index) {
                  return Card(
                    color: Theme.of(context).accentColor,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(this.meal.ingredients[index]),
                    ),
                  );
                },
                itemCount: this.meal.ingredients.length),
          )
        ],
      ),
    );
  }
}
