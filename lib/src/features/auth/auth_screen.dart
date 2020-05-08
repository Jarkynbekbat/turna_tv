import 'package:flutter/material.dart';
import 'package:login_screen/login_screen.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return LoginScreen(
      backgroundColor: Colors.blue.shade600,
      authenticator: (login, pass) => true,
      loginLabelText: 'Логин',
      passwordLabelText: 'Пароль',
      nextRoute: '\home',
      duration: 1250,
    );
  }
}
