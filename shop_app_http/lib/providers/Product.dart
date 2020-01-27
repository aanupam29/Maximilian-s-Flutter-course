import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class Product with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  bool isFavorite;

  Product({
    @required this.id,
    @required this.title,
    @required this.description,
    @required this.price,
    @required this.imageUrl,
    this.isFavorite = false,
  });

  Future<void> toggleFavoriteStatus() async {
    final url =
        'https://flutter-course-69a71.firebaseio.com/products/${this.id}.json';

    try {
      await http.patch(url,
          body: json.encode({'isFavorite': !this.isFavorite}));
      this.isFavorite = !this.isFavorite;

      notifyListeners();
    } catch (e) {
      throw (e);
    }
  }
}
