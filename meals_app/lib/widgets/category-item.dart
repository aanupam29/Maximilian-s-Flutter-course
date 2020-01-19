import 'package:flutter/material.dart';
import 'package:meals_app/screens/category-meals-screen.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final Color color;

  CategoryItem({this.title, this.color});

  void onTapCategory(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext navigatorContext) {
      return CategoryMealsScreen();
    }));
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(15),
      onTap: () => this.onTapCategory(context),
      splashColor: Colors.black38,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Text(
          this.title,
          style: Theme.of(context).textTheme.title,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              this.color.withOpacity(0.7),
              this.color.withOpacity(0.5),
              this.color.withOpacity(0.4),
              this.color,
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
