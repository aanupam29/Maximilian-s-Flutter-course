import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/ProductsProvider.dart';
import 'package:shop_app/screens/ProductFormScreen.dart';

class UserProductItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;

  UserProductItem({
    this.id,
    this.title,
    this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(this.title),
        leading: CircleAvatar(
          backgroundImage: NetworkImage(this.imageUrl),
        ),
        trailing: Container(
          width: 100,
          child: Row(
            children: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.edit,
                  color: Theme.of(context).primaryColor,
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed(
                    ProductFormScreen.routePath,
                    arguments: this.id,
                  );
                },
              ),
              IconButton(
                icon: Icon(
                  Icons.delete,
                  color: Theme.of(context).errorColor,
                ),
                onPressed: () {
                  ProductsProvider provider =
                      Provider.of<ProductsProvider>(context, listen: false);
                  provider.deleteProduct(this.id);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
