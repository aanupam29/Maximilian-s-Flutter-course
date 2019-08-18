import 'package:expenses_app/models/Transaction.dart';
import 'package:expenses_app/widgets/ChartBar.dart';
import 'package:expenses_app/widgets/Header.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  Chart({this.transactions});

  final List<Transaction> transactions;

  List<Map<String, Object>> get groupedTransactionValues {
    DateFormat formater = new DateFormat.E();

    return List.generate(7, (index) {
      DateTime date = DateTime.now().subtract(Duration(days: index));
      double daySum = 0;

      transactions.forEach((transaction) {
        if (transaction.date.day == date.day &&
            transaction.date.month == date.month &&
            transaction.date.year == date.year) {
          daySum += transaction.amount;
        }
      });

      return {'DAY': formater.format(date).substring(0, 1), 'amount': daySum};
    });
  }

  double get maxAmount {
    return groupedTransactionValues.fold(0, (sum, transaction) {
      return sum + transaction['amount'];
    });
  }

  @override
  Widget build(BuildContext context) {
    print(groupedTransactionValues);
    return Column(
      children: <Widget>[
        Header(
          text: 'Transactions of last week',
        ),
        Card(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(5),
              ),
              border: Border.all(
                color: Theme.of(context).primaryColorDark,
              ),
            ),
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: groupedTransactionValues.map((value) {
                return ChartBar(
                  amount: value['amount'],
                  label: value['label'],
                  percentageOfTotal: (value['amount'] as double) / maxAmount,
                );
              }).toList(),
            ),
            width: double.infinity,
          ),
          elevation: 5,
        ),
      ],
    );
  }
}
