import 'package:flutter/material.dart';
import 'package:shop_app/models/Product.dart';

class ProductDetails extends StatelessWidget {
  final Product product;

  ProductDetails({this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),
      ),
      body: Container(),
    );
  }
}
