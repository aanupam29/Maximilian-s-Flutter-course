import 'package:flutter/material.dart';
import 'package:personal_expenses/models/Transaction.dart';
import 'package:personal_expenses/widgets/add-transaction.dart';
import 'package:personal_expenses/widgets/chart.dart';
import 'package:personal_expenses/widgets/transactions-list.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Transaction> transactions = [
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

  int getNextId() {
    return this.transactions.last.id + 1;
  }

  void onAddTransaction(String description, double value) {
    setState(() {
      this.transactions.add(
            Transaction(
              description: description,
              value: value,
              datetime: DateTime.now(),
              id: this.getNextId(),
            ),
          );
    });
  }

  void _showBottomSheet(BuildContext contect) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext modalContext) {
          return AddTransaction(this.onAddTransaction);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Personal Expenses',
          style: TextStyle(fontFamily: 'Quicksand'),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              this._showBottomSheet(context);
            },
            color: Colors.white,
            icon: Icon(Icons.add),
          )
        ],
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
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          this._showBottomSheet(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
