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
    final Map<String, bool> settings = arguments['settings'];
    print(settings);

    final List<Meal> categoryMeals = DUMMY_MEALS
        .where(
          (Meal meal) =>
              meal.categories.contains(selectedCategory.id) &&
              (settings['glutenFree']
                  ? settings['glutenFree'] == meal.isGlutenFree
                  : true) &&
              (settings['lactoseFree']
                  ? settings['lactoseFree'] == meal.isLactoseFree
                  : true) &&
              (settings['vegetarian']
                  ? settings['vegetarian'] == meal.isVegetarian
                  : true) &&
              (settings['vegan'] ? settings['vegan'] == meal.isVegan : true),
        )
        .toList();

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
              child: categoryMeals.length > 0
                  ? ListView.builder(
                      itemBuilder: (BuildContext _, index) => MealCard(
                        meal: categoryMeals[index],
                      ),
                      itemCount: categoryMeals.length,
                    )
                  : Padding(
                      padding: EdgeInsets.only(top: 40),
                      child: Text(
                        'There is no meal that match your filters!',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ))
        ],
      ),
    );
  }
}
