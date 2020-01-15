import 'package:flutter/material.dart';
import 'package:personal_expenses/models/Transaction.dart';
import 'package:personal_expenses/widgets/transaction-item.dart';

class TransactionsList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function onRemoveTransaction;

  TransactionsList(this.transactions, this.onRemoveTransaction);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      child: Column(
        children: <Widget>[
          Text(
            'Transactions',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          Container(
            height: 400,
            child: this.transactions.isEmpty
                ? Container(
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          height: 150,
                          child: Image.asset(
                            'assets/images/waiting.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text('Start Adding Transactions!',
                            style: TextStyle(
                                fontWeight: FontWeight.w300, fontSize: 16))
                      ],
                    ),
                  )
                : ListView.builder(
                    itemBuilder: (BuildContext listViewContext, int index) {
                      Transaction transaction = transactions[index];
                      return TransactionItem(
                        index: index,
                        datetime: transaction.datetime,
                        value: transaction.value,
                        description: transaction.description,
                        onRemoveTransaction: this.onRemoveTransaction,
                      );
                    },
                    itemCount: transactions.length,
                  ),
          ),
        ],
      ),
    );
  }
}
