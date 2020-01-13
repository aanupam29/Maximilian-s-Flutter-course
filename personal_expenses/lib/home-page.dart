import 'package:flutter/material.dart';
import 'package:personal_expenses/models/Transaction.dart';
import 'package:personal_expenses/widgets/transaction-item.dart';

class HomePage extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(
      id: 1,
      description: 'Bread',
      value: .89,
      datetime: new DateTime(2019, 01, 11),
    ),
    Transaction(
      id: 2,
      description: 'Meat',
      value: 4.89,
      datetime: new DateTime(2019, 01, 10),
    ),
    Transaction(
      id: 3,
      description: 'Milk',
      value: 2.00,
      datetime: new DateTime(2019, 01, 10),
    ),
    Transaction(
      id: 4,
      description: 'Candy',
      value: .50,
      datetime: new DateTime(2019, 01, 8),
    ),
    Transaction(
      id: 5,
      description: 'Sauce',
      value: .29,
      datetime: new DateTime(2019, 01, 7),
    ),
  ];

  List<Widget> getTransactions() {
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
    return Scaffold(
      appBar: AppBar(
        title: Text('Personal Expenses'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              child: Card(
                child: Text('Chart'),
              ),
            ),
            Container(
              width: double.infinity,
              child: Card(
                child: Text('List of Transactions'),
              ),
            ),
            Column(
              children: this.getTransactions(),
            )
          ],
        ),
      ),
    );
  }
}
