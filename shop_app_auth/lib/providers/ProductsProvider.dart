import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shop_app/providers/Product.dart';

class ProductsProvider with ChangeNotifier {
  List<Product> providerProducts;
  List<Product> providerUserProducts;

  String authToken;
  String userId;

  ProductsProvider({
    this.authToken = null,
    this.userId = null,
    this.providerProducts = const [],
    this.providerUserProducts = const [],
  });

  void setToken(String token) {
    this.authToken = token;
  }

  Future<void> fetchProducts() async {
    if (this.authToken != null) {
      final url =
          'https://flutter-course-69a71.firebaseio.com/products.json?auth=$authToken';
      final favoritesUrl =
          'https://flutter-course-69a71.firebaseio.com/userFavorites/${userId}.json?auth=$authToken';

      try {
        final http.Response response = await http.get(url);
        final http.Response favoritesResponse = await http.get(favoritesUrl);

        final Map<String, dynamic> responseData = json.decode(response.body);
        final Map<String, dynamic> favoritesResponseData =
            json.decode(favoritesResponse.body);

        List<Product> loadedProducts = [];
        List<Product> userLoadedProducts = [];

        responseData.forEach((String key, dynamic value) {
          final product = Product(
            id: key,
            description: value['description'],
            imageUrl: value['imageUrl'],
            price: value['price'],
            title: value['title'],
            isFavorite: favoritesResponseData != null
                ? favoritesResponseData[key] ?? false
                : false,
          );
          loadedProducts.add(product);

          if (value['userId'] == userId) {
            userLoadedProducts.add(product);
          }
        });

        this.providerProducts = loadedProducts;
        this.providerUserProducts = userLoadedProducts;
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

  List<Product> get userProducts {
    return [...this.providerUserProducts];
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
          'userId': this.userId
        }),
      );

      String firebaseId = json.decode(response.body)['name'];

      Product product = Product(
        imageUrl: newProduct.imageUrl,
        description: newProduct.description,
        price: newProduct.price,
        title: newProduct.title,
        id: firebaseId,
      );

      this.providerProducts.add(product);
      this.providerUserProducts.add(product);

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
