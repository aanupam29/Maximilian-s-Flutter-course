import 'package:flutter/material.dart';
import 'package:meals_app/models/category.dart';
import 'package:meals_app/pages/meals_page.dart';

class CategoryCard extends StatelessWidget {
  final Category category;
  final bool isHero;

  CategoryCard({this.category, this.isHero = false});

  List<Color> _getColors() {
    if (category.colors.length == 1) {
      final Color color = category.colors[0];
      return [
        color.withOpacity(0.2),
        color.withOpacity(0.6),
        color,
      ];
    } else {
      return category.colors;
    }
  }

  Color _getTextColor() {
    if (category.colors.length == 1) {
      return Colors.white;
    } else {
      return Colors.black;
    }
  }

  void _handleTap(BuildContext context) {
    if (isHero == false) {
      print(isHero);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (BuildContext _) => MealsPage(
            selectedCategory: category,
          ),
        ),
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
                color: _getTextColor(),
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
