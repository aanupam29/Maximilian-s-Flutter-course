import 'package:expenses_app/models/Transaction.dart';
import 'package:flutter/material.dart';

class TransactionPage extends StatelessWidget {
  final Transaction selectedTransaction;

  TransactionPage({this.selectedTransaction});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
      appBar: AppBar(
        title: Text('Transaction'),
      ),
    );
  }
}
