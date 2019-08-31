import 'package:flutter/material.dart';
import 'package:meals_app/models/category.dart';

const List<Category> DUMMY_CATEGORIES = const [
  Category(
    id: 'c1',
    title: 'Italian',
    colors: const [
      Colors.green,
      Colors.white,
      Colors.white,
      Colors.red,
    ],
    beginAlignment: Alignment.centerLeft,
    endAlignment: Alignment.centerRight,
  ),
  Category(
    id: 'c2',
    title: 'Quick & Easy',
    colors: const [Colors.red],
  ),
  Category(
    id: 'c3',
    title: 'Hamburgers',
    colors: const [Colors.orange],
  ),
  Category(
    id: 'c4',
    title: 'German',
    colors: const [
      Colors.black,
      Colors.red,
      Colors.yellowAccent,
    ],
    beginAlignment: Alignment.topCenter,
    endAlignment: Alignment.bottomCenter,
  ),
  Category(
    id: 'c5',
    title: 'Light & Lovely',
    colors: const [Colors.blue],
  ),
  Category(
    id: 'c6',
    title: 'Exotic',
    colors: const [Colors.green],
  ),
  Category(
    id: 'c7',
    title: 'Breakfast',
    colors: const [Colors.lightBlue],
  ),
  Category(
    id: 'c8',
    title: 'Asian',
    colors: const [Colors.lightGreen],
  ),
  Category(
    id: 'c9',
    title: 'French',
    colors: const [
      Colors.blue,
      Colors.white,
      Colors.white,
      Colors.red,
    ],
    beginAlignment: Alignment.centerLeft,
    endAlignment: Alignment.centerRight,
  ),
  Category(
    id: 'c10',
    title: 'Summer',
    colors: const [Colors.teal],
  ),
];
