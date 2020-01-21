import 'package:flutter/material.dart';
import 'package:meals_app/models/Meal.dart';
import 'package:meals_app/screens/meal-detail-screen.dart';

class MealItem extends StatefulWidget {
  final Meal meal;
  final Function onToggleFavorite;
  bool isFavorited;

  MealItem(this.meal, this.isFavorited, this.onToggleFavorite);

  @override
  _MealItemState createState() => _MealItemState();
}

class _MealItemState extends State<MealItem> {
  void onSelectMeal(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext _) => MealDetailScreen(
          this.widget.meal,
          this.widget.isFavorited,
          this.widget.onToggleFavorite,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onSelectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    this.widget.meal.imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 30,
                  left: 20,
                  child: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.black45,
                    ),
                    width: 240,
                    child: Text(
                      this.widget.meal.title,
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ),
                Positioned(
                  top: 10,
                  right: 20,
                  child: IconButton(
                    onPressed: () {
                      setState(() {
                        this.widget.onToggleFavorite(this.widget.meal.id);
                        this.widget.isFavorited = !this.widget.isFavorited;
                      });
                    },
                    icon: Icon(
                      this.widget.isFavorited ? Icons.star : Icons.star_border,
                      size: 40,
                      color:
                          this.widget.isFavorited ? Colors.yellow : Colors.grey,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(Icons.schedule),
                      SizedBox(
                        width: 4,
                      ),
                      Text(this.widget.meal.duration.toString() + 'min'),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(Icons.work),
                      SizedBox(
                        width: 4,
                      ),
                      Text(this.widget.meal.complexityText),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(Icons.attach_money),
                      SizedBox(
                        width: 4,
                      ),
                      Text(this.widget.meal.affordabilityText),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
