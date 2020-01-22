import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/Product.dart';
import 'package:shop_app/providers/ProductsProvider.dart';

class ProductDetailScreen extends StatelessWidget {
  static const routePath = 'product-detail';

  @override
  Widget build(BuildContext context) {
    final String id = ModalRoute.of(context).settings.arguments as String;
    final ProductsProvider provider =
        Provider.of<ProductsProvider>(context, listen: false);
    final Product product = provider.findById(id);

    return Scaffold(
      appBar: AppBar(title: Text(product.title)),
    );
  }
}
