import 'package:flutter/material.dart';

class InformationScreen extends StatelessWidget {
  final String title;
  final String content;

  const InformationScreen({
    @required this.title,
    @required this.content,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(content, textAlign: TextAlign.center),
        ),
      ),
    );
  }
}
