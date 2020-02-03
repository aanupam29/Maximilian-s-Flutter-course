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
      // appBar: AppBar(title: Text(product.title)),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 300,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(product.title),
              background: Hero(
                tag: id,
                child: Image.network(
                  product.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Column(
                  children: <Widget>[
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "${product.title}: \$${product.price}",
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      product.description,
                      softWrap: true,
                    ),
                    SizedBox(
                      height: 800,
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
