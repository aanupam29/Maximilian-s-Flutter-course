import 'package:flutter/material.dart';

class TransactionListHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Text(
        'Your Transactions',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      alignment: Alignment(0, 0),
    );
  }
}
