import 'package:flutter/material.dart';

class PriceTag extends StatelessWidget {
  final double amount;

  PriceTag(this.amount);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
              border:
                  Border.all(style: BorderStyle.solid, color: Colors.black38),
            ),
            child: Text(
              '\$ ' + amount.toString(),
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
