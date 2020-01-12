import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shop_app/models/Product.dart';
import 'package:shop_app/screens/product_details.dart';

class ProductItem extends StatelessWidget {
  final Product product;

  ProductItem({this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (BuildContext ctx) => ProductDetails(
              product: product,
            ),
          ),
        );
      },
      child: ClipRRect(
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
        child: GridTile(
          child: Image.network(
            product.imgUrl,
            fit: BoxFit.cover,
          ),
          header: GridTileBar(
            leading: IconButton(
              icon: Icon(
                product.isFavorite ? Icons.favorite : Icons.favorite_border,
                color: Colors.redAccent,
              ),
              onPressed: () {},
            ),
            title: Text(
              "",
              textAlign: TextAlign.center,
            ),
            trailing: IconButton(
              icon: Icon(
                Icons.add_shopping_cart,
                color: Colors.lightGreenAccent,
              ),
              onPressed: () {},
            ),
          ),
          footer: GridTileBar(
            backgroundColor: Colors.black26,
            title: Text(
              product.title,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
