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

  void onAddTransaction() {
    if (this.descriptionController.text.length > 0 &&
        this.valueController.text.length > 0) {
      this.widget.onAddTransaction(
            this.descriptionController.text,
            double.parse(this.valueController.text),
          );

      this.descriptionController.clear();
      this.valueController.clear();

      Navigator.of(context).pop();
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          // retorna um objeto do tipo Dialog
          return AlertDialog(
            title: new Text("Alert"),
            content:
                new Text("You should provide a valid description and value!"),
            actions: <Widget>[
              // define os botões na base do dialogo
              new FlatButton(
                child: new Text("Ok"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Card(
        elevation: 6,
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
                    onSubmitted: (String _) => this.onAddTransaction(),
                  ),
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                ),
                Container(
                  child: TextField(
                    controller: valueController,
                    decoration: InputDecoration(labelText: 'Value'),
                    keyboardType: TextInputType.number,
                    onSubmitted: (String _) => this.onAddTransaction(),
                  ),
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                ),
                FlatButton(
                  child: Text(
                    'Add Transaction',
                    style: TextStyle(color: Colors.blueGrey),
                  ),
                  onPressed: this.onAddTransaction,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
