import 'package:flutter/material.dart';
import 'package:personal_expenses/models/Transaction.dart';
import 'package:personal_expenses/widgets/add-transaction.dart';
import 'package:personal_expenses/widgets/chart.dart';
import 'package:personal_expenses/widgets/transaction-item.dart';
import 'package:personal_expenses/widgets/transactions-list.dart';

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
      value: 121.50,
      datetime: new DateTime(2019, 01, 8),
    ),
    Transaction(
      id: 5,
      description: 'Sauce',
      value: .29,
      datetime: new DateTime(2019, 01, 7),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Personal Expenses'),
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) =>
            SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: ConstrainedBox(
                constraints:
                    BoxConstraints(minHeight: viewportConstraints.maxHeight),
                child: Column(
                  children: <Widget>[
                    Chart(),
                    TransactionsList(this.transactions),
                    AddTransaction()
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
