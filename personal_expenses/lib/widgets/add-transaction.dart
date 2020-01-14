import 'package:flutter/material.dart';

class AddTransaction extends StatelessWidget {
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
                    decoration: InputDecoration(labelText: 'Description'),
                  ),
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                ),
                Container(
                  child: TextField(
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
                  onPressed: () {},
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
