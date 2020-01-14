import 'package:flutter/material.dart';

class AddTransaction extends StatefulWidget {
  final Function onAddTransaction;

  AddTransaction(this.onAddTransaction);

  @override
  _AddTransactionState createState() => _AddTransactionState();
}

class _AddTransactionState extends State<AddTransaction> {
  TextEditingController descriptionController = TextEditingController();

  TextEditingController valueController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Card(
        child: Column(
          children: <Widget>[
            Text(
              'Add a new Transaction!',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Container(
                  child: TextField(
                    controller: descriptionController,
                    decoration: InputDecoration(labelText: 'Description'),
                  ),
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                ),
                Container(
                  child: TextField(
                    controller: valueController,
                    decoration: InputDecoration(labelText: 'Value'),
                    keyboardType: TextInputType.number,
                  ),
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                ),
                FlatButton(
                  child: Text(
                    'Add Transaction',
                    style: TextStyle(color: Colors.blueGrey),
                  ),
                  onPressed: () {
                    this.widget.onAddTransaction(
                          this.descriptionController.text,
                          double.parse(this.valueController.text),
                        );

                    this.descriptionController.clear();
                    this.valueController.clear();
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
