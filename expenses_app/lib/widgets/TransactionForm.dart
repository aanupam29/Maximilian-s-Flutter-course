import 'package:flutter/material.dart';

class TransactionForm extends StatelessWidget {
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController amountController = TextEditingController();

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
                print(amountController.text);
                print(descriptionController.text);
              },
            )
          ],
        ),
      ),
    );
  }
}
