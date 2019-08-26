import 'package:expenses_app/models/Transaction.dart';
import 'package:expenses_app/widgets/Chart.dart';
import 'package:expenses_app/widgets/NoTransactions.dart';
import 'package:expenses_app/widgets/TransactionList.dart';
import 'package:expenses_app/widgets/Header.dart';
import 'package:flutter/material.dart';

class Transactions extends StatelessWidget {
  final List<Transaction> transactions;
  final Function removeTransaction;
  final bool showTransactions;

  Transactions({
    this.transactions,
    this.removeTransaction,
    this.showTransactions,
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

  Widget _renderContent(Orientation currentOrientation) {
    if (currentOrientation == Orientation.landscape) {
      if (showTransactions) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Header(
              text: 'Your Transactions',
            ),
            TransactionList(
              transactions: transactions,
              removeTransaction: removeTransaction,
            ),
          ],
        );
      } else {
        return Column(
          children: <Widget>[
            Chart(
              transactions: recentTransactions,
            )
          ],
        );
      }
    } else {
      return Column(
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
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        return transactions.length > 0
            ? _renderContent(orientation)
            : NoTransactions();
      },
    );
  }
}
