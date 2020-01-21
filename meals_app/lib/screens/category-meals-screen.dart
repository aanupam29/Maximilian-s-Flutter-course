import 'package:flutter/material.dart';
import 'package:meals_app/models/Category.dart';
import 'package:meals_app/models/Meal.dart';
import 'package:meals_app/widgets/meal-item.dart';
import '../data/dummy-data.dart';

class CategoryMealsScreen extends StatefulWidget {
  final Category category;
  final Function onToggleFavorite;
  final List<String> favoritedMealsIds;
  final Map<String, bool> settings;
  List<Meal> meals;

  CategoryMealsScreen(
    this.category,
    this.favoritedMealsIds,
    this.onToggleFavorite,
    this.settings,
  ) {
    this.meals = DUMMY_MEALS.where((Meal meal) {
      return meal.categoriesIds.contains(this.category.id) &&
          (this.settings['isLactoseFree'] ? meal.isLactoseFree : true) &&
          (this.settings['isGlutenFree'] ? meal.isGlutenFree : true) &&
          (this.settings['isVegan'] ? meal.isVegan : true) &&
          (this.settings['isVegetarian'] ? meal.isVegetarian : true);
    }).toList();
  }

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(this.widget.category.title),
        ),
        body: ListView.builder(
          itemBuilder: (BuildContext _, int index) {
            return MealItem(
              this.widget.meals[index],
              this.widget.favoritedMealsIds.contains(
                    this.widget.meals[index].id,
                  ),
              this.widget.onToggleFavorite,
            );
          },
          itemCount: this.widget.meals.length,
        ));
  }
}
