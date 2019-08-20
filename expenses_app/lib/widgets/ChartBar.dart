import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double amount;
  final double percentageOfTotal;

  ChartBar({this.label, this.amount, this.percentageOfTotal});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5),
      child: Column(
        children: <Widget>[
          Container(
            height: 20,
            child: FittedBox(
              child: Text("\$ ${amount.toStringAsFixed(2)}"),
            ),
          ),
          SizedBox(
            height: 4,
          ),
          Container(
            height: 60,
            width: 10,
            child: Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                      width: 1,
                    ),
                    color: Color.fromRGBO(220, 220, 220, 1),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                FractionallySizedBox(
                  heightFactor: percentageOfTotal,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 4,
          ),
          Container(
            height: 20,
            child: FittedBox(
              child: Text("$label"),
            ),
          ),
        ],
      ),
    );
  }
}
