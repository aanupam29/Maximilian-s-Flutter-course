import 'package:expenses_app/models/Transaction.dart';
import 'package:expenses_app/widgets/PriceTag.dart';
import 'package:flutter/material.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList({this.transactions});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            child: Text(
              'Your Transactions',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            alignment: Alignment(0, 0),
          ),
          ...transactions.map((transaction) {
            return Card(
              child: ListTile(
                leading: PriceTag(transaction.amount),
                title: Text(
                  transaction.description,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  transaction.getDate(),
                  style: TextStyle(color: Colors.grey),
                ),
                trailing: Icon(
                  Icons.remove_circle_outline,
                  color: Colors.red,
                ),
              ),
            );
          }).toList()
        ],
      ),
    );
  }
}
