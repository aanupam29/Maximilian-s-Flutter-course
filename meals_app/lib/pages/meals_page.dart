import 'package:flutter/material.dart';
import 'package:meals_app/models/category.dart';
import 'package:meals_app/widgets/category_card.dart';

class MealsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final arguments =
        ModalRoute.of(context).settings.arguments as Map<String, Object>;
    final Category selectedCategory = arguments['selectedCategory'];

    print(selectedCategory);

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
        ],
      ),
    );
  }
}
