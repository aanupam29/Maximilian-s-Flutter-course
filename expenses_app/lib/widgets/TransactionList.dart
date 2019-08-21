import 'package:expenses_app/models/Transaction.dart';
import 'package:expenses_app/widgets/PriceTag.dart';
import 'package:flutter/material.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function removeTransaction;

  TransactionList({this.transactions, this.removeTransaction});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemBuilder: (ctx, index) {
          return Card(
            child: ListTile(
              leading: PriceTag(transactions[index].getAmount()),
              title: Text(
                transactions[index].description,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                transactions[index].getDate(),
                style: TextStyle(color: Colors.grey),
              ),
              trailing: IconButton(
                onPressed: () {
                  removeTransaction(index);
                },
                icon: Icon(Icons.remove_circle_outline),
                color: Colors.redAccent[700],
              ),
            ),
          );
        },
        itemCount: transactions.length,
      ),
    );
  }
}
