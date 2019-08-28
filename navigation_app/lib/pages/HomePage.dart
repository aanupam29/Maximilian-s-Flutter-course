import 'package:flutter/material.dart';
import 'package:expenses_app/models/Transaction.dart';
import 'package:expenses_app/widgets/TransactionForm.dart';
import 'package:expenses_app/widgets/Transactions.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Transaction> transactions = [];
  bool showTransactions = false;

  void _removeTransaction(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: Text("Warning"),
          content: Text(
              "You really want to remove this transaction? This action can't be undone!"),
          actions: <Widget>[
            Row(
              children: <Widget>[
                FlatButton(
                  child: Text("No!"),
                  textColor: Colors.redAccent,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                FlatButton(
                  child: Text("Yes"),
                  onPressed: () {
                    setState(() {
                      transactions.removeAt(index);
                    });
                    Navigator.of(context).pop();
                  },
                ),
              ],
            )
            // usually buttons at the bottom of the dialog
          ],
        );
      },
    );
  }

  void _addTransaction(Transaction transaction) {
    setState(() {
      transactions.add(transaction);
    });
  }

  void _showAddTransactionModal(BuildContext context, Orientation orientation) {
    showModalBottomSheet(
      isScrollControlled: orientation == Orientation.landscape ? true : false,
      context: context,
      builder: (BuildContext builderContext) {
        return TransactionForm(
          addTransaction: _addTransaction,
        );
      },
    );
  }

  void _changePerspective() {
    setState(() {
      if (showTransactions) {
        showTransactions = false;
      } else {
        showTransactions = true;
      }
    });
  }

  Widget _renderFab(BuildContext contet) {
    return OrientationBuilder(
      builder: (builderContext, Orientation orientation) {
        return orientation == Orientation.landscape
            ? FloatingActionButton(
                child: showTransactions
                    ? Icon(
                        Icons.insert_chart,
                      )
                    : Icon(Icons.list),
                onPressed: () => _changePerspective(),
              )
            : FloatingActionButton(
                child: Icon(
                  Icons.add,
                ),
                onPressed: () => _showAddTransactionModal(context, orientation),
              );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Navigation Personal Expenses'),
        actions: <Widget>[
          OrientationBuilder(
            builder: (BuildContext _, Orientation orientation) {
              return IconButton(
                icon: Icon(Icons.add),
                onPressed: () => _showAddTransactionModal(context, orientation),
              );
            },
          )
        ],
      ),
      body: Transactions(
        transactions: transactions,
        removeTransaction: _removeTransaction,
        showTransactions: showTransactions,
      ),
      floatingActionButton: _renderFab(context),
    );
  }
}
