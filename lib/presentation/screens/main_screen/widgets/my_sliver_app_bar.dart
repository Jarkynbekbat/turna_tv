import 'package:flutter/material.dart';

class MySliberAppBAr extends StatelessWidget {
  final double height;
  final Widget flexibleSpace;

  MySliberAppBAr({
    @required this.height,
    @required this.flexibleSpace,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: Text(
        'TurnaTV',
        style: TextStyle(
          fontSize: 25.0,
          color: Colors.red,
          fontWeight: FontWeight.bold,
        ),
      ),
      pinned: true,
      expandedHeight: height,
      flexibleSpace: FlexibleSpaceBar(background: flexibleSpace),
    );
  }
}
