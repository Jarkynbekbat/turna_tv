import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';

import '../../widgets/my_flat_button.dart';
import 'registration_screen.dart';

class AuthScreen extends StatefulWidget {
  static String route = "auth";

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Вход или регистрация'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(22.0),
          child: Column(
            children: <Widget>[
              SizedBox(height: 100.0),
              Text(
                'Войдите или зарегистрируйтесь чтобы воcпользоватся сервисом на любом устройстве',
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20.0),
              SignInButton(
                Buttons.GoogleDark,
                text: 'через google аккаунт',
                onPressed: () {},
              ),
              SignInButton(
                Buttons.Facebook,
                text: 'через facebook аккаунт',
                onPressed: () {},
              ),
              Text('или'),
              TextField(
                controller: _controller,
                decoration: InputDecoration(
                  labelText: "через email или телефон",
                ),
              ),
              SizedBox(height: 20.0),
              MyFlatButton(
                title: 'Продолжить',
                onClick: () => _onContinue(context),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _onContinue(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => RegistrationScreen(data: null, type: null),
    ));
  }
}
