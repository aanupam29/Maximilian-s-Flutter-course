import 'package:expenses_app/models/Transaction.dart';
import 'package:expenses_app/widgets/Chart.dart';
import 'package:expenses_app/widgets/NoTransactions.dart';
import 'package:expenses_app/widgets/TransactionList.dart';
import 'package:expenses_app/widgets/Header.dart';
import 'package:flutter/material.dart';

class Transactions extends StatelessWidget {
  final List<Transaction> transactions;
  final Function removeTransaction;

  Transactions({
    this.transactions,
    this.removeTransaction,
  });

  List<Transaction> get recentTransactions {
    return transactions.where((transaction) {
      return transaction.date.isAfter(
        DateTime.now().subtract(
          Duration(days: 7),
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return transactions.length > 0
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Chart(
                transactions: recentTransactions,
              ),
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
