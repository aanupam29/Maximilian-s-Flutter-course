import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/OrdersProvider.dart';
import 'package:shop_app/widgets/OrderItem.dart';

class OrdersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    OrdersProvider ordersProvider = Provider.of<OrdersProvider>(context);

    return ListView.builder(
      itemCount: ordersProvider.orders.length,
      itemBuilder: (BuildContext _, int index) {
        return OrderItem(ordersProvider.orders[index]);
      },
    );
  }
}
