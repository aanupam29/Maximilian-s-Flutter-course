import 'package:flutter/material.dart';
import 'package:meals_app/models/category.dart';

class CategoryCard extends StatelessWidget {
  final Category category;

  CategoryCard({this.category});

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

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
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
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
