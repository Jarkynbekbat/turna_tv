import 'package:flutter/material.dart';
import 'package:turna_tv/ui/screens/main/main_screen.dart';

import 'ui/screens/auth/auth_screen.dart';
import 'ui/screens/home/home_screen.dart';
import 'ui/screens/profile/profile_screen.dart';

// #51597e
// #ff0000
// #151721

ThemeData getTheme() {
  return ThemeData(
    primaryColor: Color(0xff342b38),
    accentColor: Color(0xffff0000),
    scaffoldBackgroundColor: Color(0xff151721),
    textTheme: TextTheme(
      bodyText1: TextStyle(
        color: Colors.white.withOpacity(0.7),
      ),
      bodyText2: TextStyle(
        color: Colors.white.withOpacity(0.8),
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    ),
    iconTheme: IconThemeData(
      color: Colors.white.withOpacity(0.8),
    ),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: Colors.white,
      labelStyle: TextStyle(
        color: Colors.white,
      ),
    ),
  );
}

Map<String, WidgetBuilder> getRoutes() => <String, WidgetBuilder>{
      MainScreen.route: (context) => MainScreen(),
      AuthScreen.route: (context) => AuthScreen(),
      HomeScreen.route: (context) => HomeScreen(),
      ProfileScreen.route: (context) => ProfileScreen(),
    };
