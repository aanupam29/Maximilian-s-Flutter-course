import 'package:flutter/foundation.dart';
import 'package:shop_app/models/CartItem.dart';

class CartProvider with ChangeNotifier {
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get items {
    return {...this._items};
  }

  void addItem(String productId, double price, String title) {
    if (this._items.containsKey(productId)) {
      this._items.update(
            productId,
            (existing) => CartItem(
              id: existing.id,
              productTitle: existing.productTitle,
              quantity: existing.quantity + 1,
              price: existing.price,
            ),
          );
    } else {
      this._items.putIfAbsent(
            productId,
            () => CartItem(
              id: DateTime.now().toString(),
              productTitle: title,
              price: price,
              quantity: 1,
            ),
          );
    }
    notifyListeners();
  }

  double get total {
    double total = 0;

    this._items.forEach((String key, CartItem item) {
      total += item.price * item.quantity;
    });

    return total;
  }

  int get cartCount {
    return _items.keys.length;
  }

  void removeItem(String id) {
    this._items.remove(id);
    notifyListeners();
  }

  void clearCart() {
    this._items = {};
    notifyListeners();
  }
}
