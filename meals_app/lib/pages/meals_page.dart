import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy-data.dart';
import 'package:meals_app/models/category.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/widgets/category_card.dart';
import 'package:meals_app/widgets/meal_card.dart';

class MealsPage extends StatelessWidget {
  final List<Meal> allMeals = DUMMY_MEALS;

  @override
  Widget build(BuildContext context) {
    final arguments =
        ModalRoute.of(context).settings.arguments as Map<String, Object>;
    final Category selectedCategory = arguments['selectedCategory'];
    final List<Meal> categoryMeals = DUMMY_MEALS
        .where(
          (Meal meal) => meal.categories.contains(selectedCategory.id),
        )
        .toList();

    print(categoryMeals);

    return Scaffold(
      appBar: AppBar(
        title: Text("${selectedCategory.title} meals"),
      ),
      body: Column(
        children: <Widget>[
          Hero(
            tag: "categoryHero${selectedCategory.id}",
            child: CategoryCard(
              isHero: true,
              category: selectedCategory,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (BuildContext _, index) => MealCard(
                meal: categoryMeals[index],
              ),
              itemCount: categoryMeals.length,
            ),
          )
        ],
      ),
    );
  }
}
