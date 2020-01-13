import 'package:flutter/foundation.dart';

class Transaction {
  int id;
  String description;
  double value;
  DateTime datetime;

  Transaction({
    @required this.id,
    @required this.description,
    @required this.value,
    @required this.datetime,
  });
}
