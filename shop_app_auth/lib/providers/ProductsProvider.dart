import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shop_app/providers/Product.dart';

class ProductsProvider with ChangeNotifier {
  List<Product> providerProducts;

  String authToken;

  ProductsProvider({this.authToken = null, this.providerProducts = const []});

  void setToken(String token) {
    this.authToken = token;
  }

  Future<void> fetchProducts() async {
    if (this.authToken != null) {
      final url =
          'https://flutter-course-69a71.firebaseio.com/products.json?auth=$authToken';
      try {
        final http.Response response = await http.get(url);
        final Map<String, dynamic> responseData = json.decode(response.body);
        List<Product> loadedProducts = [];

        responseData.forEach((String key, dynamic value) {
          loadedProducts.add(Product(
            id: key,
            description: value['description'],
            imageUrl: value['imageUrl'],
            price: value['price'],
            title: value['title'],
            isFavorite: value['isFavorite'],
          ));
        });

        this.providerProducts = loadedProducts;
        notifyListeners();
      } catch (e) {
        print(e);
        print('fetchProducts $e');

        throw (e);
      }
    }
  }

  bool _onlyFavorites = false;

  void setOnlyFavorites(bool onlyFavorites) {
    this._onlyFavorites = onlyFavorites;
    notifyListeners();
  }

  List<Product> get products {
    return this._onlyFavorites ? this.favorites : [...this.providerProducts];
  }

  List<Product> get allProducts {
    return [...this.providerProducts];
  }

  List<Product> get favorites {
    return [
      ...this.providerProducts.where((Product product) => product.isFavorite)
    ];
  }

  Future<void> addProduct(Product newProduct) async {
    final url =
        'https://flutter-course-69a71.firebaseio.com/products.json?auth=$authToken';

    try {
      http.Response response = await http.post(
        url,
        body: json.encode({
          'title': newProduct.title,
          'description': newProduct.description,
          'price': newProduct.price,
          'imageUrl': newProduct.imageUrl,
          'isFavorite': newProduct.isFavorite
        }),
      );

      String firebaseId = json.decode(response.body)['name'];

      Product product = Product(
        imageUrl: newProduct.imageUrl,
        description: newProduct.description,
        price: newProduct.price,
        title: newProduct.title,
        isFavorite: false,
        id: firebaseId,
      );

      this.providerProducts.add(product);
      notifyListeners();
    } catch (error) {
      print('addProduct $error');
      throw (error);
    }
  }

  Future<void> updateProduct(String id, Product updatedProduct) async {
    final url =
        'https://flutter-course-69a71.firebaseio.com/products/$id.json?auth=$authToken';

    try {
      await http.patch(url,
          body: json.encode({
            'title': updatedProduct.title,
            'description': updatedProduct.description,
            'imageUrl': updatedProduct.imageUrl,
            'price': updatedProduct.price
          }));

      final productIndex = this
          .providerProducts
          .indexWhere((Product product) => product.id == id);

      if (productIndex >= 0) {
        this.providerProducts[productIndex] = updatedProduct;
        notifyListeners();
      }
    } catch (e) {
      throw (e);
    }
  }

  Product findById(String id) {
    return this.providerProducts.firstWhere((Product product) {
      return product.id == id;
    });
  }

  Future<void> deleteProduct(String id) async {
    final url = 'https://flutter-course-69a71.firebaseio.com/products/$id.json';

    await http.delete(url);

    this.providerProducts.removeWhere((Product product) => product.id == id);
    notifyListeners();
  }
}
