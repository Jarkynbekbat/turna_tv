import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  final String message;
  const ErrorScreen(this.message);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(message),
    );
  }
}
