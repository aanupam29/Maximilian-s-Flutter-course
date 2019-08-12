import 'package:expenses_app/models/Transaction.dart';
import 'package:expenses_app/widgets/PriceTag.dart';
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
          Card(
            child: Container(
              padding: EdgeInsets.all(10),
              color: Colors.orange,
              child: Text('CHART'),
              width: double.infinity,
            ),
            elevation: 5,
          ),
          Card(
            child: Container(
              padding: EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(labelText: 'Description'),
                  ),
                  TextField(
                    decoration: InputDecoration(labelText: 'Amount'),
                  ),
                  FlatButton(
                    child: Text('Add Transaction'),
                    textColor: Colors.orange,
                    onPressed: () {},
                  )
                ],
              ),
            ),
          ),
          Column(
            children: [
              ...transactions.map((transaction) {
                return Card(
                  child: ListTile(
                    leading: PriceTag(transaction.amount),
                    title: Text(
                      transaction.description,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      transaction.getDate(),
                      style: TextStyle(color: Colors.grey),
                    ),
                    trailing: Icon(
                      Icons.remove_circle_outline,
                      color: Colors.red,
                    ),
                  ),
                );
              }).toList()
            ],
          ),
        ],
      ),
    );
  }
}
