import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CardShimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 114.7,
        height: 180.0,
        child: Shimmer.fromColors(
          baseColor: Colors.grey,
          highlightColor: Colors.white,
          child: Container(
            color: Theme.of(context).primaryColor,
          ),
        ));
  }
}
