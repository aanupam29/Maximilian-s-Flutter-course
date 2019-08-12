import 'package:flutter/material.dart';

class Chart extends StatefulWidget {
  @override
  _ChartState createState() => _ChartState();
}

class _ChartState extends State<Chart> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
        color: Colors.orange,
        child: Text('CHART'),
        width: double.infinity,
      ),
      elevation: 5,
    );
  }
}
