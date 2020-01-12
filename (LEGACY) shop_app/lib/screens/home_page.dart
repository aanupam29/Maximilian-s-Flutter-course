import 'package:flutter/material.dart';
import 'package:shop_app/data/Products.dart' as Products;
import 'package:shop_app/models/Product.dart';
import 'package:shop_app/widgets/product_item.dart';

class HomePage extends StatelessWidget {
  final List<Product> products = Products.products;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shop App'),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 15, bottom: 5),
              child: Text(
                'Product List',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
            ),
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.all(10),
                itemCount: products.length,
                itemBuilder: (BuildContext itemBuilderContext, int index) =>
                    ProductItem(
                  product: products[index],
                ),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 3 / 2,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
