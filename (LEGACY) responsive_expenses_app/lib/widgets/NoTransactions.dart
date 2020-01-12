import 'package:expenses_app/widgets/Header.dart';
import 'package:flutter/material.dart';

class NoTransactions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Header(text: 'No transactions added!'),
        Container(
          height: 150,
          child: Image.asset(
            'assets/images/waiting.png',
            fit: BoxFit.cover,
          ),
        )
      ],
    );
  }
}
