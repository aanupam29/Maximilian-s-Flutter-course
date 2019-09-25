import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';

class MealCard extends StatelessWidget {
  final Meal meal;

  MealCard({@required this.meal});

  void _handleTap(BuildContext context) {
    Navigator.pushNamed(context, '/meal', arguments: {'meal': meal});
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Ink(
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 5,
          margin: EdgeInsets.all(15),
          child: InkWell(
            onTap: () => _handleTap(context),
            child: Column(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                      child: Hero(
                          tag: "mealHero${meal.id}",
                          child: Material(
                            child: Ink.image(
                              image: NetworkImage(meal.imageUrl),
                              child: Container(
                                height: 250,
                                width: double.infinity,
                              ),
                              fit: BoxFit.cover,
                            ),
                          )
                          // Image.network(
                          //   meal.imageUrl,
                          //   height: 250,
                          //   width: double.infinity,
                          //   fit: BoxFit.cover,
                          // ),
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
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.all(15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(right: 4.0),
                            child: Icon(Icons.videogame_asset),
                          ),
                          Text(
                            meal.getComplexity,
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(right: 4.0),
                            child: Icon(Icons.attach_money),
                          ),
                          Text(
                            meal.getAffordability,
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(right: 4.0),
                            child: Icon(Icons.timer),
                          ),
                          Text(
                            meal.getDuration,
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
