import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';

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
              Text('Войдите или зарегистрируйтесь'),
              Text('чтобы воcпользоватся сервисом на любом устройстве'),
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
              SizedBox(
                width: double.infinity,
                child: FlatButton(
                  color: Theme.of(context).accentColor,
                  onPressed: () {},
                  child: Text(
                    'Продолжить',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
