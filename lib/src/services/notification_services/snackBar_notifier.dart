import 'package:flutter/material.dart';

SnackBar actionPassedNotifier({String info}) {
  return SnackBar(
    content: Text('$info'),
    duration: Duration(seconds: 4),
    backgroundColor:Colors.green.shade300,
  );
}

SnackBar actionFailedNotifier({String info}) {
  return SnackBar(
    content: Text('$info'),
    duration: Duration(seconds: 4),
    backgroundColor: Colors.red.shade300,
  );
}
