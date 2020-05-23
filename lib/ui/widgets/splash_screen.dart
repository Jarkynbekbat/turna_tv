import 'package:flutter/material.dart';
import 'package:turna_tv/ui/widgets/app_bar_title.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            AppBarTitle(),
            Text('кино начинается с тебя'),
          ],
        ),
      ),
    );
  }
}
