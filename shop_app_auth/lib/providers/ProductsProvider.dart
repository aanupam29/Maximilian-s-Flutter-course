import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shop_app/providers/Product.dart';

class ProductsProvider with ChangeNotifier {
  List<Product> _products = [
    // Product(
    //   id: 'p1',
    //   title: 'Red Shirt',
    //   description: 'A red shirt - it is pretty red!',
    //   price: 29.99,
    //   imageUrl:
    //       'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
    // ),
    // Product(
    //   id: 'p2',
    //   title: 'Trousers',
    //   description: 'A nice pair of trousers.',
    //   price: 59.99,
    //   imageUrl:
    //       'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Trousers%2C_dress_%28AM_1960.022-8%29.jpg/512px-Trousers%2C_dress_%28AM_1960.022-8%29.jpg',
    // ),
    // Product(
    //   id: 'p3',
    //   title: 'Yellow Scarf',
    //   description: 'Warm and cozy - exactly what you need for the winter.',
    //   price: 19.99,
    //   imageUrl:
    //       'https://live.staticflickr.com/4043/4438260868_cc79b3369d_z.jpg',
    // ),
    // Product(
    //   id: 'p4',
    //   title: 'A Pan',
    //   description: 'Prepare any meal you want.',
    //   price: 49.99,
    //   imageUrl:
    //       'https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/Cast-Iron-Pan.jpg/1024px-Cast-Iron-Pan.jpg',
    // ),
  ];

  String authToken;

  ProductsProvider({this.authToken = null});

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

        this._products = loadedProducts;
        notifyListeners();
      } catch (e) {
        print(e);
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
    return this._onlyFavorites ? this.favorites : [...this._products];
  }

  List<Product> get allProducts {
    return [...this._products];
  }

  List<Product> get favorites {
    return [...this._products.where((Product product) => product.isFavorite)];
  }

  Future<void> addProduct(Product newProduct) async {
    const url = 'https://flutter-course-69a71.firebaseio.com/products.json';

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

      this._products.add(product);
      notifyListeners();
    } catch (error) {
      print(error);
      throw (error);
    }
  }

  Future<void> updateProduct(String id, Product updatedProduct) async {
    final url = 'https://flutter-course-69a71.firebaseio.com/products/$id.json';

    try {
      await http.patch(url,
          body: json.encode({
            'title': updatedProduct.title,
            'description': updatedProduct.description,
            'imageUrl': updatedProduct.imageUrl,
            'price': updatedProduct.price
          }));

      final productIndex =
          this._products.indexWhere((Product product) => product.id == id);

      if (productIndex >= 0) {
        this._products[productIndex] = updatedProduct;
        notifyListeners();
      }
    } catch (e) {
      throw (e);
    }
  }

  Product findById(String id) {
    return this._products.firstWhere((Product product) {
      return product.id == id;
    });
  }

  Future<void> deleteProduct(String id) async {
    final url = 'https://flutter-course-69a71.firebaseio.com/products/$id.json';

    await http.delete(url);

    this._products.removeWhere((Product product) => product.id == id);
    notifyListeners();
  }
}
