import 'package:flutter/material.dart';
import 'package:meals_app/models/Category.dart';
import 'package:meals_app/screens/category-meals-screen.dart';

class CategoryItem extends StatelessWidget {
  final List<String> favoritedMealsIds;
  final Function onToggleFavorite;
  final Category category;

  CategoryItem(this.category, this.favoritedMealsIds, this.onToggleFavorite);

  void onTapCategory(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext navigatorContext) {
          return CategoryMealsScreen(
            this.category,
            this.favoritedMealsIds,
            this.onToggleFavorite,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(15),
      onTap: () => this.onTapCategory(
        context,
      ),
      splashColor: Colors.black38,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Text(
          this.category.title,
          style: Theme.of(context).textTheme.title,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              this.category.color.withOpacity(0.7),
              this.category.color.withOpacity(0.5),
              this.category.color.withOpacity(0.4),
              this.category.color,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
