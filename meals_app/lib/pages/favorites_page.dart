import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';

class FavoritesPage extends StatefulWidget {
  final List<Meal> previouslyFavoritedMeals;

  FavoritesPage({this.previouslyFavoritedMeals});

  @override
  _FavoritesPageState createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("${widget.previouslyFavoritedMeals.length} favorited meals"),
    );
  }
}
