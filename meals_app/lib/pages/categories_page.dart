import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy-data.dart';
import 'package:meals_app/models/category.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/widgets/category_card.dart';

class CategoriesPage extends StatelessWidget {
  final List<Category> categories = DUMMY_CATEGORIES;
  final Map<String, bool> settings;
  final List<Meal> favoriteMeals;

  CategoriesPage({this.settings, this.favoriteMeals});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView(
        padding: EdgeInsets.all(10),
        children: categories
            .map(
              (category) => Hero(
                tag: "categoryHero${category.id}",
                child: CategoryCard(
                  category: category,
                  settings: settings,
                  favoriteMeals: favoriteMeals,
                ),
              ),
            )
            .toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
      ),
    );
  }
}
