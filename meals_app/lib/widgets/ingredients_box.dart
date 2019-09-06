import 'package:flutter/material.dart';

class IngredientsBox extends StatelessWidget {
  final List<String> ingredients;

  IngredientsBox({this.ingredients});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 5),
      padding: EdgeInsets.all(5),
      height: 200,
      width: MediaQuery.of(context).size.width * 0.7,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: ListView.builder(
        itemCount: ingredients.length,
        itemBuilder: (BuildContext _, int index) => Container(
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.all(3),
          child: Text(ingredients[index]),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
            color: Colors.yellow,
          ),
        ),
      ),
    );
  }
}
