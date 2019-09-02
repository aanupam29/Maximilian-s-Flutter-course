import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';

class MealCard extends StatelessWidget {
  final Meal meal;

  MealCard({@required this.meal});

  void _handleTap() {}

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _handleTap,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 5,
        margin: EdgeInsets.all(15),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                  child: Image.network(
                    meal.imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                    ),
                    color: Color.fromRGBO(110, 110, 110, 0.5),
                  ),
                  margin: EdgeInsets.only(left: 80, top: 180),
                  padding: EdgeInsets.all(10),
                  width: double.infinity,
                  alignment: Alignment.bottomRight,
                  child: Text(
                    meal.title,
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
