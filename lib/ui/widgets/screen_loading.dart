import 'package:flutter/material.dart';
import 'package:turna_tv/ui/widgets/app_bar_title.dart';

class ScreenLoading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(width: MediaQuery.of(context).size.width),
          AppBarTitle(),
          SizedBox(height: 18.0),
          CircularProgressIndicator(),
        ],
      ),
    );
  }
}
