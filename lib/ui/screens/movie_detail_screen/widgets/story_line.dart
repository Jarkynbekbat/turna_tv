import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';

class Storyline extends StatelessWidget {
  Storyline(this.storyline);
  final String storyline;

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Описание',
          style: textTheme.subhead.copyWith(fontSize: 18.0),
        ),
        SizedBox(height: 8.0),

        Html(
          data: storyline,
          style: {
            "p": Style(
              fontSize: FontSize.large,
              color: Colors.black45,
            ),
          },
        ),
        // Text(
        //   storyline,
        //   style: textTheme.body1.copyWith(
        //     color: Colors.black45,
        //     fontSize: 16.0,
        //   ),
        // ),
      ],
    );
  }
}
