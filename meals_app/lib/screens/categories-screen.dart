import 'package:flutter/material.dart';
import 'package:meals_app/widgets/category-item.dart';
import '../data/dummy-data.dart';

class CategoriesScreen extends StatelessWidget {
  final List<String> favoritedMealsIds;
  final Function onToggleFavorite;

  CategoriesScreen(this.favoritedMealsIds, this.onToggleFavorite);

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(10),
      children: DUMMY_CATEGORIES
          .map((category) => CategoryItem(
                category,
                this.favoritedMealsIds,
                this.onToggleFavorite,
              ))
          .toList(),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: MediaQuery.of(context).size.width * 0.6,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
    );
  }
}
