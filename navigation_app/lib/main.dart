import 'package:expenses_app/models/Transaction.dart';
import 'package:expenses_app/widgets/TransactionForm.dart';
import 'package:expenses_app/widgets/Transactions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  // SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigation Personal Expenses',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Quicksand',
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Transaction> transactions = [];
  bool showTransactions = false;

  void _removeTransaction(int index) {
    setState(() {
      transactions.removeAt(index);
    });
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
    });
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
            })
          ],
        ),
        body: Transactions(
          transactions: transactions,
          removeTransaction: _removeTransaction,
          showTransactions: showTransactions,
        ),
        floatingActionButton: _renderFab(context));
  }
}
