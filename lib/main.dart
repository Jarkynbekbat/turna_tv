import 'package:first_time_screen/first_time_screen.dart';
import 'package:flutter/material.dart';
import 'package:loading_animations/loading_animations.dart';

import 'presentation/screens/auth_screen/auth_screen.dart';
import 'presentation/screens/home_screen/home_screen.dart';
import 'presentation/screens/intro_screen/intro_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // theme: ThemeData.light(),
      routes: <String, WidgetBuilder>{
        AuthScreen.route: (context) => AuthScreen(),
        HomeScreen.route: (context) => HomeScreen(),
      },
      home: FirstTimeScreen(
        loadingScreen:
            LoadingBouncingGrid.circle(borderColor: Colors.deepOrange),
        introScreen: MaterialPageRoute(builder: (context) => IntroScreen()),
        // landingScreen: MaterialPageRoute(builder: (context) => AuthScreen()),
        // landingScreen: MaterialPageRoute(builder: (context) => IntroScreen()),
        landingScreen: MaterialPageRoute(builder: (context) => HomeScreen()),
      ),
    );
  }
}
