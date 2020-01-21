import 'package:flutter/material.dart';
import 'package:meals_app/models/Meal.dart';

class MealDetailScreen extends StatefulWidget {
  final Meal meal;
  final Function onToggleFavorite;
  bool isFavorited;

  MealDetailScreen(this.meal, this.isFavorited, this.onToggleFavorite);

  @override
  _MealDetailScreenState createState() => _MealDetailScreenState();
}

class _MealDetailScreenState extends State<MealDetailScreen> {
  Widget _buildContainter(Widget child) {
    return Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Colors.grey,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        height: 200,
        width: 250,
        child: child);
  }

  List<Widget> _buildIngredients(BuildContext context) {
    return [
      Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        child: Text(
          'Ingredients',
          style: Theme.of(context).textTheme.title,
        ),
      ),
      this._buildContainter(
        ListView.builder(
            itemBuilder: (BuildContext _, int index) {
              return Card(
                color: Theme.of(context).accentColor,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(this.widget.meal.ingredients[index]),
                ),
              );
            },
            itemCount: this.widget.meal.ingredients.length),
      )
    ];
  }

  List<Widget> buildSteps(BuildContext context) {
    return [
      Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        child: Text(
          'Steps',
          style: Theme.of(context).textTheme.title,
        ),
      ),
      this._buildContainter(
        ListView.builder(
            itemBuilder: (BuildContext _, int index) {
              return Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  children: <Widget>[
                    ListTile(
                      leading: CircleAvatar(
                        child: Text("#${index + 1}"),
                      ),
                      title: Text(this.widget.meal.steps[index]),
                    ),
                    Divider(
                      color: Colors.grey,
                    )
                  ],
                ),
              );
            },
            itemCount: this.widget.meal.steps.length),
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.widget.meal.title),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(bottom: 20),
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  Image.network(
                    this.widget.meal.imageUrl,
                    fit: BoxFit.cover,
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
                        this.widget.isFavorited
                            ? Icons.star
                            : Icons.star_border,
                        size: 40,
                        color: this.widget.isFavorited
                            ? Colors.yellow
                            : Colors.grey,
                      ),
                    ),
                  )
                ],
              ),
            ),
            ...this._buildIngredients(context),
            ...this.buildSteps(context),
          ],
        ),
      ),
    );
  }
}
