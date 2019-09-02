import 'package:flutter/material.dart';

class MealsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meals'),
      ),
      body: Center(
        child: Text('Recepies of the category!'),
      ),
    );
  }
}
