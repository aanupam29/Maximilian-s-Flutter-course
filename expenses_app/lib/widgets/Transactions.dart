import 'package:expenses_app/models/Transaction.dart';
import 'package:expenses_app/widgets/Chart.dart';
import 'package:expenses_app/widgets/NoTransactions.dart';
import 'package:expenses_app/widgets/TransactionForm.dart';
import 'package:expenses_app/widgets/TransactionList.dart';
import 'package:expenses_app/widgets/Header.dart';
import 'package:flutter/material.dart';

class Transactions extends StatelessWidget {
  final List<Transaction> transactions;
  final Function addTransaction;
  final Function removeTransaction;

  Transactions({
    this.transactions,
    this.addTransaction,
    this.removeTransaction,
  });

  @override
  Widget build(BuildContext context) {
    return transactions.length > 0
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Chart(),
              Header(
                text: 'Your Transactions',
              ),
              TransactionList(
                transactions: transactions,
                removeTransaction: removeTransaction,
              ),
            ],
          )
        : NoTransactions();
  }
}
