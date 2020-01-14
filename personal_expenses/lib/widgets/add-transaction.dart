import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddTransaction extends StatefulWidget {
  final Function onAddTransaction;

  AddTransaction(this.onAddTransaction);

  @override
  _AddTransactionState createState() => _AddTransactionState();
}

class _AddTransactionState extends State<AddTransaction> {
  TextEditingController descriptionController = TextEditingController();
  TextEditingController valueController = TextEditingController();
  DateTime datetime = DateTime.now();

  void _onAddTransaction() {
    if (this.descriptionController.text.length > 0 &&
        this.valueController.text.length > 0 &&
        this.datetime != null) {
      this.widget.onAddTransaction(this.descriptionController.text,
          double.parse(this.valueController.text), this.datetime);

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
            content: new Text(
                "You should provide a valid description, date and value!"),
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

  Future<Null> _openDatePicker() async {
    final DateTime pickedDate = await showDatePicker(
        context: context,
        initialDate: datetime,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));

    if (pickedDate != null) {
      setState(() {
        this.datetime = pickedDate;
      });
    }
  }

  String _formatDate() {
    DateFormat formater = DateFormat('dd/MM/yyyy');
    return this.datetime != null
        ? formater.format(this.datetime)
        : 'Pick a Date!';
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
                    onSubmitted: (String _) => this._onAddTransaction(),
                  ),
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                ),
                Container(
                  child: TextField(
                    controller: valueController,
                    decoration: InputDecoration(labelText: 'Value'),
                    keyboardType: TextInputType.number,
                    onSubmitted: (String _) => this._onAddTransaction(),
                  ),
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(_formatDate()),
                      IconButton(
                        onPressed: () {
                          this._openDatePicker();
                        },
                        icon: Icon(Icons.calendar_today),
                      )
                    ],
                  ),
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                ),
                FlatButton(
                  child: Text(
                    'Add Transaction',
                    style: TextStyle(color: Colors.blueGrey),
                  ),
                  onPressed: this._onAddTransaction,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
