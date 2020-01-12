import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy-data.dart';
import 'package:meals_app/models/category.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/widgets/category_card.dart';

class CategoriesPage extends StatefulWidget {
  final Map<String, bool> settings;
  final List<Meal> rootFavoriteMeals;
  final Function addFavoriteMealToRoot;

  CategoriesPage({
    this.settings,
    this.rootFavoriteMeals,
    this.addFavoriteMealToRoot,
  });

  @override
  _CategoriesPageState createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  final List<Category> categories = DUMMY_CATEGORIES;

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
                  settings: widget.settings,
                  rootFavoriteMeals: widget.rootFavoriteMeals,
                  addFavoriteMealToRoot: widget.addFavoriteMealToRoot,
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
