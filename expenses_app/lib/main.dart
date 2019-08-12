import 'package:expenses_app/models/Transaction.dart';
import 'package:expenses_app/widgets/Chart.dart';
import 'package:expenses_app/widgets/PriceTag.dart';
import 'package:expenses_app/widgets/TransactionForm.dart';
import 'package:expenses_app/widgets/TransactionList.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Transaction> transactions = [
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Personal Expenses'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Chart(),
          TransactionForm(),
          TransactionList(
            transactions: transactions,
          ),
        ],
      ),
    );
  }
}
