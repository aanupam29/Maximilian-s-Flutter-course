import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/models/CartItem.dart';
import 'package:shop_app/providers/OrdersProvider.dart';
import 'package:shop_app/widgets/CartItem.dart' as wi;
import 'package:shop_app/providers/CartProvider.dart';

class CartScreen extends StatelessWidget {
  static const routePath = 'cart';

  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);
    OrdersProvider ordersProvider =
        Provider.of<OrdersProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text('Your Cart'),
      ),
      body: Column(
        children: <Widget>[
          Card(
            margin: EdgeInsets.all(15),
            child: Padding(
              padding: EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Total',
                    style: TextStyle(fontSize: 20),
                  ),
                  Spacer(),
                  Chip(
                    label: Text(
                      '\$${cartProvider.total.toStringAsFixed(2)}',
                      style: TextStyle(color: Colors.white),
                    ),
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                  FlatButton(
                    child: Text('ORDER NOW'),
                    onPressed: () {
                      ordersProvider.addOrder(
                        cartProvider.items.values.toList(),
                        cartProvider.total,
                      );
                      cartProvider.clearCart();
                    },
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: cartProvider.cartCount,
              itemBuilder: (BuildContext _, int index) {
                return wi.CartItem(
                  productId: cartProvider.items.keys.toList()[index],
                  id: cartProvider.items.values.toList()[index].id,
                  price: cartProvider.items.values.toList()[index].price,
                  quantity: cartProvider.items.values.toList()[index].quantity,
                  title: cartProvider.items.values.toList()[index].productTitle,
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
