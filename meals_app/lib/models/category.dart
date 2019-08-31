import 'package:flutter/material.dart';

class Category {
  final String id;
  final String title;
  final List<Color> colors;
  final Alignment beginAlignment;
  final Alignment endAlignment;

  const Category({
    @required this.id,
    @required this.title,
    this.beginAlignment = Alignment.topLeft,
    this.endAlignment = Alignment.bottomRight,
    this.colors = const [Colors.orange],
  });
}
