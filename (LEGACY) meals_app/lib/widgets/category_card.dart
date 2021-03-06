import 'package:flutter/material.dart';
import 'package:meals_app/models/category.dart';
import 'package:meals_app/models/meal.dart';

class CategoryCard extends StatelessWidget {
  final Category category;
  final bool isHero;
  final Map<String, bool> settings;
  final List<Meal> rootFavoriteMeals;
  final Function addFavoriteMealToRoot;

  CategoryCard({
    this.category,
    this.isHero = false,
    this.settings,
    this.rootFavoriteMeals,
    this.addFavoriteMealToRoot,
  });

  List<Color> _getColors() {
    final Color color = category.colors[0];
    return [
      color.withOpacity(0.1),
      color.withOpacity(0.6),
      color,
    ];
  }

  void _handleTap(BuildContext context) {
    if (isHero == false) {
      Navigator.pushNamed(
        context,
        '/meals',
        arguments: {
          'selectedCategory': category,
          'settings': settings,
          'rootFavoriteMeals': rootFavoriteMeals,
          'addFavoriteMealToRoot': addFavoriteMealToRoot
        },
      );
    }
  }

  BorderRadius _getBorder() {
    if (isHero == false) {
      return BorderRadius.circular(10);
    } else {
      return BorderRadius.circular(0);
    }
  }

  EdgeInsets _getPadding() {
    if (isHero == false) {
      return EdgeInsets.all(5);
    } else {
      return EdgeInsets.only(top: 40, bottom: 40, left: 5, right: 5);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        splashColor: category.colors[0],
        borderRadius: _getBorder(),
        onTap: () {
          _handleTap(context);
        },
        child: Container(
          padding: _getPadding(),
          child: Center(
            child: Text(
              category.title,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: _getColors(),
              begin: category.beginAlignment,
              end: category.endAlignment,
              // begin: Alignment.topLeft,
              // end: Alignment.bottomRight,
            ),
            borderRadius: _getBorder(),
          ),
        ),
      ),
    );
  }
}
