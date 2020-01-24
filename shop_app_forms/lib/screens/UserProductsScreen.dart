import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/Product.dart';
import 'package:shop_app/providers/ProductsProvider.dart';
import 'package:shop_app/widgets/UserProductItem.dart';

class UserProductsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ProductsProvider productsProvider = Provider.of<ProductsProvider>(context);
    List<Product> products = productsProvider.allProducts;

    print(products);
    return Padding(
      padding: EdgeInsets.all(8),
      child: ListView.builder(
        itemCount: products.length,
        itemBuilder: (BuildContext _, int index) {
          return UserProductItem(
            title: products[index].title,
            imageUrl: products[index].imageUrl,
          );
        },
      ),
    );
  }
}
