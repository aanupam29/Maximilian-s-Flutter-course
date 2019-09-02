import 'package:flutter/material.dart';
import 'package:meals_app/models/category.dart';
import 'package:meals_app/widgets/category_card.dart';

class MealsPage extends StatelessWidget {
  final Category selectedCategory;

  MealsPage({this.selectedCategory});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meals'),
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
        ],
      ),
    );
  }
}
