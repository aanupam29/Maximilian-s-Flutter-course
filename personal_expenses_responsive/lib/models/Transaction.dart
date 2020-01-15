import 'package:flutter/foundation.dart';

class Transaction {
  String description;
  double value;
  DateTime datetime;

  Transaction({
    @required this.description,
    @required this.value,
    @required this.datetime,
  });
}
