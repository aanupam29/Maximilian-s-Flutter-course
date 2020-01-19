import 'package:flutter/material.dart';
import 'package:meals_app/models/Category.dart';

class CategoryMealsScreen extends StatelessWidget {
  final Category category;

  CategoryMealsScreen(this.category);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.category.title),
      ),
      body: Center(
        child: Text('Recipes'),
      ),
    );
  }
}
