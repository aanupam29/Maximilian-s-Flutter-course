import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/widgets/how_to.dart';
import 'package:meals_app/widgets/ingredients_box.dart';

class MealPage extends StatefulWidget {
  @override
  _MealPageState createState() => _MealPageState();
}

class _MealPageState extends State<MealPage> {
  Meal meal;
  Function favorite;
  bool isFavorite;

  @override
  Widget build(BuildContext context) {
    final arguments =
        ModalRoute.of(context).settings.arguments as Map<String, Object>;

    if (meal == null && favorite == null && isFavorite == null) {
      this.meal = arguments['meal'];
      this.favorite = arguments['favorite'];
      this.isFavorite = arguments['isFavorite'];
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("${meal.title}"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(bottom: 40),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Hero(
                  tag: "mealHero${meal.id}",
                  child: Material(
                    child: InkWell(
                      child: Ink.image(
                        image: NetworkImage(meal.imageUrl),
                        child: Container(
                          height: 300,
                          width: double.infinity,
                        ),
                        fit: BoxFit.cover,
                      ),
                      onTap: () {},
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      favorite(meal);
                      isFavorite = !isFavorite;
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: 80),
                    padding: EdgeInsets.all(10),
                    width: double.infinity,
                    alignment: Alignment.bottomRight,
                    child: Icon(
                      isFavorite ? Icons.star : Icons.star_border,
                      size: 40,
                      color: isFavorite ? Colors.yellow : Colors.grey,
                    ),
                  ),
                )
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 30, bottom: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Ingredients',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  IngredientsBox(
                    ingredients: meal.ingredients,
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 30, bottom: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'How to do',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  HowTo(
                    steps: meal.steps,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
