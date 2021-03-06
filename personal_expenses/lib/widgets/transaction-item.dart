import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionItem extends StatelessWidget {
  final int index;
  final String description;
  final DateTime datetime;
  final double value;
  final Function onRemoveTransaction;

  TransactionItem({
    this.index,
    this.description,
    this.datetime,
    this.value,
    this.onRemoveTransaction,
  });

  String _formatDatetime() {
    DateFormat formater = DateFormat('dd/MM/yyyy');
    String dateString = formater.format(this.datetime);

    return dateString;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
          padding: const EdgeInsets.only(top: 8, bottom: 8, left: 4, right: 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  ConstrainedBox(
                    constraints: BoxConstraints(minWidth: 80),
                    child: Container(
                      margin: EdgeInsets.only(right: 8),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Center(
                          child: Text(
                            "\$ ${value.toStringAsFixed(2)}",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(
                          color: Colors.green,
                          width: 2,
                        ),
                      ),
                      padding: EdgeInsets.only(top: 6, bottom: 6),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        description,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        this._formatDatetime(),
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              IconButton(
                color: Colors.red,
                icon: Icon(Icons.delete),
                onPressed: () {
                  this.onRemoveTransaction(this.index);
                },
              )
            ],
          )),
    );
  }
}
