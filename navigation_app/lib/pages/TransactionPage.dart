import 'package:expenses_app/models/Transaction.dart';
import 'package:flutter/material.dart';

class TransactionPage extends StatelessWidget {
  final Transaction selectedTransaction;

  TransactionPage({this.selectedTransaction});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "\$ ${selectedTransaction.getAmount()}",
                  style: TextStyle(
                    fontSize: 40,
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  selectedTransaction.description,
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  selectedTransaction.getDate(),
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      MaterialButton(
                        child: Text('< Go back'),
                        textColor: Colors.white,
                        color: Colors.blue,
                        onPressed: () {
                          Navigator.pop(context, false);
                        },
                      ),
                      MaterialButton(
                        child: Text('Remove!'),
                        textColor: Colors.white,
                        color: Colors.red,
                        onPressed: () {
                          Navigator.pop(context, true);
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        appBar: AppBar(
          title: Text('Transaction'),
        ),
      ),
      onWillPop: () async {
        Navigator.pop(context, false);
        return Future.value(false);
      },
    );
  }
}
