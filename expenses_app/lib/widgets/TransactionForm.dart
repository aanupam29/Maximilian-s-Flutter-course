import 'package:expenses_app/models/Transaction.dart';
import 'package:flutter/material.dart';

class TransactionForm extends StatelessWidget {
  TransactionForm({this.addTransaction});

  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController amountController = TextEditingController();
  final Function addTransaction;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Description'),
              controller: descriptionController,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountController,
            ),
            FlatButton(
              child: Text('Add Transaction'),
              textColor: Colors.orange,
              onPressed: () {
                Transaction newTransaction = new Transaction(
                  amount: double.parse(amountController.text),
                  date: DateTime.now(),
                  description: descriptionController.text,
                  id: 'aopsdjasod',
                );

                addTransaction(newTransaction);
              },
            )
          ],
        ),
      ),
    );
  }
}
