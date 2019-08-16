import 'package:expenses_app/models/Transaction.dart';
import 'package:expenses_app/widgets/Chart.dart';
import 'package:expenses_app/widgets/TransactionForm.dart';
import 'package:expenses_app/widgets/TransactionList.dart';
import 'package:expenses_app/widgets/TransactionListHeader.dart';
import 'package:flutter/material.dart';

class Transactions extends StatelessWidget {
  final List<Transaction> transactions;
  final Function addTransaction;

  Transactions({this.transactions, this.addTransaction});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Chart(),
        TransactionListHeader(),
        TransactionList(
          transactions: transactions,
        ),
      ],
    );
  }
}
