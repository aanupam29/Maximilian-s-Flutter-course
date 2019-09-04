import 'package:flutter/foundation.dart';

enum Complexity { Simple, Challenging, Hard }
enum Affordability { Affordable, Pricey, Luxurious }

class Meal {
  final String id;
  final List<String> categories;
  final String title;
  final String imageUrl;
  final List<String> ingredients;
  final List<String> steps;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  final bool isGlutenFree;
  final bool isLactoseFree;
  final bool isVegan;
  final bool isVegetarian;

  const Meal({
    @required this.id,
    @required this.categories,
    @required this.title,
    @required this.imageUrl,
    @required this.ingredients,
    @required this.steps,
    @required this.duration,
    @required this.complexity,
    @required this.affordability,
    @required this.isGlutenFree,
    @required this.isLactoseFree,
    @required this.isVegan,
    @required this.isVegetarian,
  });

  String get getComplexity {
    String mealComplexity;

    switch (complexity) {
      case Complexity.Simple:
        mealComplexity = 'Simple';
        break;

      case Complexity.Challenging:
        mealComplexity = 'Challenging';
        break;

      case Complexity.Hard:
        mealComplexity = 'Hard';
        break;
    }

    return mealComplexity;
  }

  String get getAffordability {
    String mealAffordability;

    switch (affordability) {
      case Affordability.Affordable:
        mealAffordability = 'Affordable';
        break;

      case Affordability.Pricey:
        mealAffordability = 'Pricey';
        break;

      case Affordability.Luxurious:
        mealAffordability = 'Luxurious';
        break;
    }

    return mealAffordability;
  }

  String get getDuration {
    return "$duration min";
  }
}
