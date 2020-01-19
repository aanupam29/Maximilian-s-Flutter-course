import 'package:flutter/material.dart';
import 'package:meals_app/models/Meal.dart';

class MealDetailScreen extends StatelessWidget {
  final Meal meal;

  MealDetailScreen(this.meal);

  Widget _buildContainter(Widget child) {
    return Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Colors.grey,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        height: 200,
        width: 250,
        child: child);
  }

  List<Widget> _buildIngredients(BuildContext context) {
    return [
      Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        child: Text(
          'Ingredients',
          style: Theme.of(context).textTheme.title,
        ),
      ),
      this._buildContainter(
        ListView.builder(
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
    ];
  }

  List<Widget> buildSteps(BuildContext context) {
    return [
      Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        child: Text(
          'Steps',
          style: Theme.of(context).textTheme.title,
        ),
      ),
      this._buildContainter(
        ListView.builder(
            itemBuilder: (BuildContext _, int index) {
              return Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  children: <Widget>[
                    ListTile(
                      leading: CircleAvatar(
                        child: Text("#${index + 1}"),
                      ),
                      title: Text(this.meal.steps[index]),
                    ),
                    Divider(
                      color: Colors.grey,
                    )
                  ],
                ),
              );
            },
            itemCount: this.meal.steps.length),
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.meal.title),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(bottom: 20),
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                this.meal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            ...this._buildIngredients(context),
            ...this.buildSteps(context),
          ],
        ),
      ),
    );
  }
}
