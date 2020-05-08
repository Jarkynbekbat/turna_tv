import 'package:flutter/material.dart';
import 'package:first_time_screen/first_time_screen.dart';
import 'package:turna_tv/src/features/intro/intro_screen.dart';
import 'src/features/auth/auth_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FirstTimeScreen(
        loadingScreen: Text("Loading"),
        introScreen: MaterialPageRoute(builder: (context) => IntroScreen()),
        landingScreen: MaterialPageRoute(builder: (context) => AuthScreen()),
      ),
    );
  }
}
