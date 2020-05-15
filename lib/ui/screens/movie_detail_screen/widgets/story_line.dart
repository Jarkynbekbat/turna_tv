import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';

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

        Html(
          data: storyline,
          style: {
            "p": Style(
              fontSize: FontSize.large,
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
