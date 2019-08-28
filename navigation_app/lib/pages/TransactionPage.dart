import 'package:expenses_app/models/Transaction.dart';
import 'package:flutter/material.dart';

class TransactionPage extends StatelessWidget {
  final Transaction selectedTransaction;

  TransactionPage({this.selectedTransaction});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Text(
                "\$ ${selectedTransaction.getAmount()}",
                style: TextStyle(
                  fontSize: 40,
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Center(
              child: Text(
                selectedTransaction.description,
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Center(
              child: Text(
                selectedTransaction.getDate(),
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('Transaction'),
      ),
    );
  }
}
