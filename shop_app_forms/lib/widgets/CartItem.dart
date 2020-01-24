import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/CartProvider.dart';

class CartItem extends StatelessWidget {
  final String id;
  final String productId;
  final double price;
  final int quantity;
  final String title;

  CartItem({this.productId, this.id, this.price, this.quantity, this.title});

  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider =
        Provider.of<CartProvider>(context, listen: false);

    return Dismissible(
      key: ValueKey(id),
      direction: DismissDirection.endToStart,
      onDismissed: (DismissDirection direction) {
        cartProvider.removeItem(productId);
      },
      confirmDismiss: (DismissDirection direction) {
        return showDialog(
          context: context,
          builder: (BuildContext _) => AlertDialog(
            title: Text('Are you sure?'),
            content: Text('Do you want to remove the item from the cart?'),
            actions: <Widget>[
              FlatButton(
                child: Text('No'),
                onPressed: () {
                  Navigator.of(_).pop(false);
                },
              ),
              FlatButton(
                child: Text('Yes'),
                onPressed: () {
                  Navigator.of(_).pop(true);
                },
              ),
            ],
          ),
        );
      },
      background: Container(
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
        padding: EdgeInsets.only(right: 10),
        color: Theme.of(context).errorColor,
        child: Icon(
          Icons.delete,
          color: Colors.white,
          size: 40,
        ),
        alignment: Alignment.centerRight,
      ),
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
        child: Padding(
          padding: EdgeInsets.all(8),
          child: ListTile(
            leading: CircleAvatar(
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: FittedBox(child: Text('\$$price')),
              ),
            ),
            title: Text(title),
            subtitle: Text('Total: \$${price * quantity}'),
            trailing: Text("$quantity x"),
          ),
        ),
      ),
    );
  }
}
