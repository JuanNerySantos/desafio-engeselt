import 'package:flutter/material.dart';

void messageError(String messageError, BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(messageError.toString()),
      backgroundColor: Colors.red,
      duration: Duration(seconds: 10),
    ),
  );
}
