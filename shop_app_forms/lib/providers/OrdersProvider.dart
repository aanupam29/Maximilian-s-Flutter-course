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
  List<Order> _orders = [];

  List<Order> get orders {
    return [...this._orders];
  }

  void addOrder(List<CartItem> cartProducts, double total) {
    this._orders.insert(
          0,
          Order(
            id: DateTime.now().toString(),
            amount: total,
            products: cartProducts,
            datetime: DateTime.now(),
          ),
        );
    notifyListeners();
  }
}
