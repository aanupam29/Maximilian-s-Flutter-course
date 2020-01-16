import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expenses/models/Transaction.dart';
import 'package:personal_expenses/widgets/chart_bar.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;
  final double appBarHeight;
  final Orientation orientation;

  Chart(this.recentTransactions, this.appBarHeight, this.orientation);

  List<Map<String, Object>> groupedTransactionValues() {
    return List.generate(7, (int index) {
      final DateTime weekDay = DateTime.now().subtract(Duration(days: index));
      double totalSumOfDay = 0;

      recentTransactions.forEach((transaction) {
        if (transaction.datetime.day == weekDay.day &&
            transaction.datetime.month == weekDay.month &&
            transaction.datetime.year == weekDay.year) {
          totalSumOfDay += transaction.value;
        }
      });

      return {
        'day': DateFormat.E().format(weekDay).substring(0, 1),
        'amount': totalSumOfDay
      };
    });
  }

  double getMaxSpending() {
    return this.recentTransactions.fold(0, (sum, transaction) {
      return sum + transaction.value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: (MediaQuery.of(context).size.height -
              MediaQuery.of(context).padding.top -
              appBarHeight) *
          (this.orientation == Orientation.landscape ? 0.6 : 0.3),
      width: double.infinity,
      child: Card(
        elevation: 6,
        child: !this.recentTransactions.isEmpty
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: groupedTransactionValues().map(
                  (day) {
                    return ChartBar(
                      amount: day['amount'],
                      label: day['day'],
                      amountPercentageOfTotal:
                          ((day['amount'] as double) / this.getMaxSpending()),
                    );
                  },
                ).toList(),
              )
            : Text('Start Adding Transactions!'),
      ),
    );
  }
}
