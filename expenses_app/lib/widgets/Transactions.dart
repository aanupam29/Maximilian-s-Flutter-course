import 'package:expenses_app/models/Transaction.dart';
import 'package:expenses_app/widgets/Chart.dart';
import 'package:expenses_app/widgets/TransactionForm.dart';
import 'package:expenses_app/widgets/TransactionList.dart';
import 'package:flutter/material.dart';

class Transactions extends StatefulWidget {
  final List<Transaction> transactions;
  Transactions({Key key, this.transactions}) : super(key: key);

  @override
  _TransactionsState createState() => _TransactionsState();
}

class _TransactionsState extends State<Transactions> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Chart(),
        TransactionForm(),
        TransactionList(
          transactions: widget.transactions,
        ),
      ],
    );
  }
}
