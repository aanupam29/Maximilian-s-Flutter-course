import 'package:expenses_app/models/Transaction.dart';
import 'package:expenses_app/widgets/Chart.dart';
import 'package:expenses_app/widgets/TransactionForm.dart';
import 'package:expenses_app/widgets/TransactionList.dart';
import 'package:flutter/material.dart';

class Transactions extends StatefulWidget {
  @override
  _TransactionsState createState() => _TransactionsState();
}

class _TransactionsState extends State<Transactions> {
  List<Transaction> transactions = [
    Transaction(
      id: 'osdij89',
      description: 'New shoes',
      amount: 49.89,
      date: DateTime.now(),
    ),
    Transaction(
      id: '8273uc981n3',
      description: 'Lunch',
      amount: 12.99,
      date: DateTime.now(),
    ),
  ];

  void _addTransaction(Transaction transaction) {
    setState(() {
      transactions.add(transaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Chart(),
        TransactionForm(addTransaction: _addTransaction),
        TransactionList(
          transactions: transactions,
        ),
      ],
    );
  }
}
