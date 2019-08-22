import 'package:expenses_app/models/Transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

class TransactionForm extends StatefulWidget {
  TransactionForm({this.addTransaction});

  final Function addTransaction;

  @override
  _TransactionFormState createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  DateTime date;
  final DateFormat formater = new DateFormat('yyyy-MM-dd');
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController amountController = TextEditingController();
  final Uuid uuid = new Uuid();

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Container(
              alignment: AlignmentDirectional.center,
              child: Text(
                'Add a new transaction!',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Description'),
              controller: descriptionController,
              onSubmitted: (_) {
                handleSubmit();
              },
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              onSubmitted: (_) {
                handleSubmit();
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                date != null
                    ? Text("Selected date: ${formater.format(date)}")
                    : Text('No date selected!'),
                FlatButton(
                  child: Text('Select date'),
                  textColor: Colors.blue[900],
                  onPressed: _showDatePicker,
                ),
              ],
            ),
            Center(
              child: RaisedButton(
                child: Text('Add Transaction'),
                color: Colors.blue[900],
                textColor: Colors.white,
                onPressed: handleSubmit,
              ),
            )
          ],
        ),
      ),
    );
  }

  void _showDatePicker() async {
    DateTime selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2018),
      lastDate: DateTime(2030),
      builder: (BuildContext context, Widget child) {
        return Theme(
          data: ThemeData.dark(),
          child: child,
        );
      },
    );

    if (selectedDate != null) {
      setState(() {
        date = selectedDate;
      });
    }
  }

  void _showDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Warning"),
          content: new Text(
              "You must provide a valid description, amount and date!"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Ok!"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void handleSubmit() {
    if (amountController.text.trim().length > 0 &&
        descriptionController.text.trim().length > 0 &&
        date != null) {
      Transaction newTransaction = new Transaction(
        amount: double.parse(amountController.text),
        date: date,
        description: descriptionController.text,
        id: uuid.v4(),
      );

      widget.addTransaction(newTransaction);
      Navigator.of(context).pop();
    } else {
      _showDialog();
    }
  }
}
