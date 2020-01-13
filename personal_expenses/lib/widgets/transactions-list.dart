import 'package:flutter/material.dart';
import 'package:personal_expenses/models/Transaction.dart';
import 'package:personal_expenses/widgets/transaction-item.dart';

class TransactionsList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionsList(this.transactions);

  List<Widget> _renderTransactions() {
    return this
        .transactions
        .map(
          (Transaction transaction) => TransactionItem(
            datetime: transaction.datetime,
            value: transaction.value,
            description: transaction.description,
          ),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Text(
            'Transactions',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          ...this._renderTransactions(),
        ],
      ),
    );
  }
}
