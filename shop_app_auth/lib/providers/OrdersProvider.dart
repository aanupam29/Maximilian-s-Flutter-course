import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:shop_app/models/CartItem.dart';

class Order {
  final String id;
  final double amount;
  final List<CartItem> products;
  final DateTime datetime;

  Order({
    this.id,
    this.amount,
    this.products,
    this.datetime,
  });
}

class OrdersProvider with ChangeNotifier {
  List<Order> providerOrders;

  List<Order> get orders {
    return [...this.providerOrders];
  }

  String token;

  OrdersProvider({this.token = null, this.providerOrders = const []});

  Future<void> addOrder(List<CartItem> cartProducts, double total) async {
    try {
      final DateTime datetime = DateTime.now();
      final url =
          'https://flutter-course-69a71.firebaseio.com/orders.json?auth=$token';
      await http.post(url,
          body: json.encode({
            'amount': total,
            'products': cartProducts
                .map(
                  (CartItem cartItem) => {
                    'id': cartItem.id,
                    'productTitle': cartItem.productTitle,
                    'quantity': cartItem.quantity,
                    'price': cartItem.price,
                  },
                )
                .toList(),
            'datetime': datetime.millisecondsSinceEpoch
          }));

      this.providerOrders.insert(
            0,
            Order(
              id: DateTime.now().toString(),
              amount: total,
              products: cartProducts,
              datetime: datetime,
            ),
          );

      notifyListeners();
    } catch (e) {
      throw (e);
    }
  }

  Future<void> fetchOrders() async {
    final url =
        'https://flutter-course-69a71.firebaseio.com/orders.json?auth=$token';

    try {
      final http.Response response = await http.get(url);
      final Map<String, dynamic> responseData = json.decode(response.body);

      List<Order> loadedOrders = [];

      if (responseData != null) {
        responseData.forEach((String key, dynamic value) {
          List<CartItem> products = [];

          value['products'].map((cartItem) {
            products.add(
              CartItem(
                id: cartItem['id'],
                price: cartItem['price'],
                productTitle: cartItem['productTitle'],
                quantity: cartItem['quantity'],
              ),
            );
          }).toList();

          loadedOrders.add(Order(
            id: key,
            amount: value['amount'],
            datetime: DateTime.fromMillisecondsSinceEpoch(value['datetime']),
            products: products,
          ));
        });
      }

      this.providerOrders = loadedOrders;
      notifyListeners();
    } catch (e) {
      print(e);
      throw (e);
    }
  }
}
