import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/Product.dart';
import 'package:shop_app/providers/ProductsProvider.dart';
import 'package:shop_app/widgets/ProductsList.dart';

class ProductsOverviewScreen extends StatelessWidget {
  final List<Product> products = [];

  @override
  Widget build(BuildContext context) {
    final ProductsProvider productsProvider =
        Provider.of<ProductsProvider>(context);
    List<Product> products = productsProvider.products;

    return Scaffold(
      appBar: AppBar(
        title: Text('Shop'),
      ),
      body: ProductsList(products: products),
    );
  }
}
