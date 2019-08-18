import 'package:expenses_app/widgets/Header.dart';
import 'package:flutter/material.dart';

class Chart extends StatefulWidget {
  @override
  _ChartState createState() => _ChartState();
}

class _ChartState extends State<Chart> {
  @override
  Widget build(BuildContext context) {
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
            child: Text('CHART'),
            width: double.infinity,
          ),
          elevation: 5,
        ),
      ],
    );
  }
}
