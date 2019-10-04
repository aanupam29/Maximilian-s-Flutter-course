import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/widgets/meal_card.dart';

class FavoritesPage extends StatefulWidget {
  final List<Meal> rootFavoriteMeals;
  final Function addFavoriteMealToRoot;

  FavoritesPage({
    this.rootFavoriteMeals,
    this.addFavoriteMealToRoot,
  });

  @override
  _FavoritesPageState createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      width: double.infinity,
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.favorite,
                size: 70,
                color: Theme.of(context).accentColor,
              ),
              Text(
                "Favorite Meals",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Expanded(
            child: widget.rootFavoriteMeals.length > 0
                ? ListView.builder(
                    itemBuilder: (BuildContext _, index) => MealCard(
                      meal: widget.rootFavoriteMeals[index],
                      isFavorite: true,
                      favorite: widget.addFavoriteMealToRoot,
                    ),
                    itemCount: widget.rootFavoriteMeals.length,
                  )
                : Padding(
                    padding: EdgeInsets.only(top: 40),
                    child: Text(
                      'There is no favorited meals yet, go on and favorite some meals pal!',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
