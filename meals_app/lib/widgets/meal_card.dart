import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';

class MealCard extends StatefulWidget {
  final Meal meal;
  final bool isFavorite;
  final Function favorite;

  MealCard({
    @required this.meal,
    this.isFavorite,
    this.favorite,
  });

  @override
  _MealCardState createState() => _MealCardState();
}

class _MealCardState extends State<MealCard> {
  void _handleTap(BuildContext context) {
    Navigator.pushNamed(context, '/meal', arguments: {
      'meal': widget.meal,
      'isFavorite': widget.isFavorite,
      'favorite': widget.favorite
    });
  }

  Widget _renderFavoriteIcon() {
    return InkWell(
      onTap: () {
        widget.favorite(widget.meal.id);
      },
      child: Container(
        margin: EdgeInsets.only(left: 80),
        padding: EdgeInsets.all(10),
        width: double.infinity,
        alignment: Alignment.bottomRight,
        child: Icon(
          widget.isFavorite ? Icons.star : Icons.star_border,
          size: 40,
          color: widget.isFavorite ? Colors.yellow : Colors.grey,
        ),
      ),
    );
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
                          tag: "mealHero${widget.meal.id}",
                          child: Material(
                            child: Ink.image(
                              image: NetworkImage(widget.meal.imageUrl),
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
                    _renderFavoriteIcon(),
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
                        widget.meal.title,
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
                            widget.meal.getComplexity,
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
                            widget.meal.getAffordability,
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
                            widget.meal.getDuration,
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
