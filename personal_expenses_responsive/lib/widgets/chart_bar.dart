import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double amount;
  final double amountPercentageOfTotal;

  ChartBar({this.label, this.amount, this.amountPercentageOfTotal});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext builderContext, BoxConstraints constraints) {
      return Padding(
        padding: const EdgeInsets.only(right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              height: constraints.maxHeight * 0.1,
              child: FittedBox(
                child: Text('\$${amount.toStringAsFixed(2)}'),
              ),
            ),
            SizedBox(
              height: constraints.maxHeight * 0.05,
            ),
            Container(
              height: constraints.maxHeight * 0.7,
              width: 10,
              child: Stack(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1),
                      color: Color.fromRGBO(220, 220, 220, 1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  FractionallySizedBox(
                    heightFactor: this.amountPercentageOfTotal,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.yellow,
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: constraints.maxHeight * 0.05,
            ),
            Container(
              height: constraints.maxHeight * 0.1,
              child: FittedBox(
                child: Text(label),
              ),
            )
          ],
        ),
      );
    });
  }
}
