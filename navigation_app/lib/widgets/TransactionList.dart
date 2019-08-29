import 'package:expenses_app/models/Transaction.dart';
import 'package:expenses_app/pages/TransactionPage.dart';
import 'package:expenses_app/widgets/PriceTag.dart';
import 'package:flutter/material.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function removeTransaction;

  TransactionList({this.transactions, this.removeTransaction});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemBuilder: (ctx, index) {
          return Padding(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: Card(
              child: ListTile(
                leading: PriceTag(transactions[index].getAmount()),
                title: Text(
                  transactions[index].description,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  transactions[index].getDate(),
                  style: TextStyle(color: Colors.grey),
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    IconButton(
                      onPressed: () {
                        removeTransaction(index);
                      },
                      icon: Icon(Icons.remove_circle_outline),
                      color: Colors.redAccent[700],
                    ),
                    IconButton(
                      onPressed: () async {
                        bool shouldDelete = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext _) {
                              return TransactionPage(
                                  selectedTransaction: transactions[index]);
                            },
                          ),
                        );
                        print(shouldDelete);

                        if (shouldDelete == true) {
                          removeTransaction(index);
                        }
                      },
                      icon: Icon(Icons.info_outline),
                      color: Colors.purpleAccent,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        itemCount: transactions.length,
      ),
    );
  }
}
