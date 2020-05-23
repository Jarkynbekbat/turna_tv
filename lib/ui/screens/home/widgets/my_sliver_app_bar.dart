import 'package:flutter/material.dart';

import '../../../widgets/app_bar_title.dart';

class MySliberAppBar extends StatelessWidget {
  final double height;
  final Widget flexibleSpace;

  MySliberAppBar({
    @required this.height,
    @required this.flexibleSpace,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: AppBarTitle(),
      pinned: true,
      expandedHeight: height,
      flexibleSpace: FlexibleSpaceBar(background: flexibleSpace),
    );
  }
}
