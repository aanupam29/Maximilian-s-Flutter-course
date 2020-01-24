import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/Product.dart';
import 'package:shop_app/providers/ProductsProvider.dart';
import 'package:shop_app/widgets/ProductsList.dart';

class ProductsOverviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ProductsList();
  }
}
