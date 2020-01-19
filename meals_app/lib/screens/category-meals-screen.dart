import 'package:flutter/material.dart';
import 'package:meals_app/models/Category.dart';
import 'package:meals_app/models/Meal.dart';
import 'package:meals_app/widgets/meal-item.dart';
import '../data/dummy-data.dart';

class CategoryMealsScreen extends StatelessWidget {
  final Category category;
  List<Meal> meals;

  CategoryMealsScreen(this.category) {
    this.meals = DUMMY_MEALS.where((Meal meal) {
      return meal.categoriesIds.contains(this.category.id);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(this.category.title),
        ),
        body: ListView.builder(
          itemBuilder: (BuildContext _, int index) {
            return MealItem(this.meals[index]);
          },
          itemCount: this.meals.length,
        ));
  }
}
