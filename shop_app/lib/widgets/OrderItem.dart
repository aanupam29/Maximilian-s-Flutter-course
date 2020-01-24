import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shop_app/models/CartItem.dart';
import 'package:shop_app/providers/OrdersProvider.dart';
import 'package:intl/intl.dart';

class OrderItem extends StatefulWidget {
  final Order order;

  OrderItem(this.order);

  @override
  _OrderItemState createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderItem> {
  bool expanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text('\$${this.widget.order.amount}'),
            subtitle: Text(
              DateFormat('dd MM yyyy hh:mm').format(widget.order.datetime),
            ),
            trailing: IconButton(
              icon: Icon(this.expanded ? Icons.expand_less : Icons.expand_more),
              onPressed: () {
                setState(() {
                  this.expanded = !this.expanded;
                });
              },
            ),
          ),
          if (this.expanded)
            Container(
              padding: EdgeInsets.all(10),
              height: min(widget.order.products.length * 20.0 + 80, 100),
              child: ListView(
                children: widget.order.products.map((CartItem product) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        product.productTitle,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text("${product.quantity}x \$${product.price}",
                          style: TextStyle(fontSize: 18, color: Colors.grey))
                    ],
                  );
                }).toList(),
              ),
            )
        ],
      ),
    );
  }
}
