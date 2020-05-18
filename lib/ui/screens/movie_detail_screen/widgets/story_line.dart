import 'package:flutter/material.dart';

class Storyline extends StatelessWidget {
  Storyline(this.storyline);
  final String storyline;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Описание',
          style: Theme.of(context).textTheme.bodyText2,
        ),
        SizedBox(height: 8.0),
        Text(
          storyline,
          style: Theme.of(context).textTheme.bodyText1.copyWith(
                fontSize: 16.0,
              ),
        ),
        SizedBox(height: 20.0),
      ],
    );
  }
}
