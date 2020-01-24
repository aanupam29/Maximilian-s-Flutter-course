import 'package:flutter/foundation.dart';
import 'package:shop_app/providers/Product.dart';

class CartItem {
  final String id;
  final String productTitle;
  final int quantity;
  final double price;

  CartItem({
    @required this.id,
    @required this.productTitle,
    @required this.quantity,
    @required this.price,
  });
}
