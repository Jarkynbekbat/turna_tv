import 'package:flutter/material.dart';
import 'package:turna_tv/ui/screens/profile_screen/profile_screen.dart';

import 'ui/screens/auth_screen/auth_screen.dart';
import 'ui/screens/home_screen/home_screen.dart';

// #51597e
// #ff0000
// #151721

ThemeData getTheme() {
  return ThemeData(
    primaryColor: Color(0xff45046a),
    // primaryColor: Color(0xff151721),
    backgroundColor: Color(0xff5c2a9d),
    accentColor: Color(0xffff0000),

    scaffoldBackgroundColor: Color(0xff5c2a9d),
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
      AuthScreen.route: (context) => AuthScreen(),
      HomeScreen.route: (context) => HomeScreen(),
      ProfileScreen.route: (context) => ProfileScreen(),
    };
