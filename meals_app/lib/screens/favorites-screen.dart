import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy-data.dart';
import 'package:meals_app/models/Meal.dart';
import 'package:meals_app/widgets/meal-item.dart';

class FavoritesScreen extends StatefulWidget {
  final List<String> favoritedMealsIds;
  final Function onToggleFavorite;

  FavoritesScreen(this.favoritedMealsIds, this.onToggleFavorite);

  @override
  _FavoritesScreenState createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  Widget build(BuildContext context) {
    return this.widget.favoritedMealsIds.length > 0
        ? ListView.builder(
            itemCount: this.widget.favoritedMealsIds.length,
            itemBuilder: (BuildContext _, int index) {
              Meal meal = DUMMY_MEALS.firstWhere((Meal meal) {
                return meal.id == this.widget.favoritedMealsIds[index];
              });

              return MealItem(
                meal,
                this.widget.favoritedMealsIds.contains(meal.id),
                this.widget.onToggleFavorite,
              );
            },
          )
        : Center(
            child: Text('Start adding some favorites!'),
          );
  }
}
