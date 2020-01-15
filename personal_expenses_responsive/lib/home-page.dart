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
      description: 'Bread',
      value: .89,
      datetime: new DateTime(2020, 1, 11),
    ),
    Transaction(
      description: 'Meat',
      value: 4.89,
      datetime: new DateTime(2020, 1, 10),
    ),
    Transaction(
      description: 'Milk',
      value: 2.00,
      datetime: new DateTime(2020, 1, 10),
    ),
    Transaction(
      description: 'Candy',
      value: 121.50,
      datetime: new DateTime(2020, 1, 8),
    ),
    Transaction(
      description: 'Sauce',
      value: .29,
      datetime: new DateTime(2020, 1, 7),
    ),
  ];

  void onAddTransaction(String description, double value, DateTime datetime) {
    setState(() {
      this.transactions.add(
            Transaction(
              description: description,
              value: value,
              datetime: datetime,
            ),
          );
    });
  }

  void onRemoveTransaction(int index) {
    setState(() {
      this.transactions.removeAt(index);
    });
  }

  void _showBottomSheet(BuildContext contect) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (BuildContext modalContext) {
          return FractionallySizedBox(
            heightFactor: 0.8,
            child: AddTransaction(this.onAddTransaction),
          );
        });
  }

  List<Transaction> getRecentTransactions() {
    DateTime limitDay = DateTime.now().subtract(Duration(days: 7));

    return this.transactions.where((transaction) {
      return transaction.datetime.isAfter(limitDay);
    }).toList();
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
                  Chart(this.getRecentTransactions()),
                  TransactionsList(this.transactions, this.onRemoveTransaction),
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
