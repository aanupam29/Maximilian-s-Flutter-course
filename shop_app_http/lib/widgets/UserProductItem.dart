import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/ProductsProvider.dart';
import 'package:shop_app/screens/ProductFormScreen.dart';

class UserProductItem extends StatefulWidget {
  final String id;
  final String title;
  final String imageUrl;

  UserProductItem({
    this.id,
    this.title,
    this.imageUrl,
  });

  @override
  _UserProductItemState createState() => _UserProductItemState();
}

class _UserProductItemState extends State<UserProductItem> {
  bool deleting = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(this.widget.title),
        leading: CircleAvatar(
          backgroundImage: NetworkImage(this.widget.imageUrl),
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
                    arguments: this.widget.id,
                  );
                },
              ),
              IconButton(
                icon: !this.deleting
                    ? Icon(
                        Icons.delete,
                        color: Theme.of(context).errorColor,
                      )
                    : CircularProgressIndicator(),
                onPressed: !this.deleting
                    ? () async {
                        ProductsProvider provider =
                            Provider.of<ProductsProvider>(context,
                                listen: false);
                        try {
                          setState(() {
                            this.deleting = true;
                          });
                          await provider.deleteProduct(this.widget.id);
                          setState(() {
                            this.deleting = false;
                          });
                        } catch (e) {
                          setState(() {
                            this.deleting = false;
                          });
                        }
                      }
                    : null,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
