import 'package:flutter/material.dart';

import '../auth_screen/auth_screen.dart';
import 'widgets/grid_button.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 10.0),
          SizedBox(height: 20.0),
          Container(
            width: double.infinity,
            color: Colors.grey,
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Подписка',
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20.0),
                Text(
                  'Подключить',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
          SizedBox(height: 10.0),
          Container(
            width: double.infinity,
            color: Colors.grey,
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Счет Turna',
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20.0),
                Text(
                  '0 сом',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
          SizedBox(height: 20.0),
          Row(
            children: <Widget>[
              GridButton(
                title: 'Смотреть позже',
                iconData: Icons.turned_in_not,
                onClick: () {},
              ),
              SizedBox(width: 10.0),
              GridButton(
                title: 'Просмотры',
                iconData: Icons.access_time,
                onClick: () {},
              ),
            ],
          ),
          SizedBox(height: 10.0),
          Row(
            children: <Widget>[
              GridButton(
                title: 'Помощь',
                iconData: Icons.help,
                onClick: () {},
              ),
              SizedBox(width: 10.0),
              GridButton(
                title: 'О нас',
                iconData: Icons.info,
                onClick: () {},
              ),
            ],
          ),
          SizedBox(height: 20.0),
          Center(
            child: FlatButton(
              color: Theme.of(context).accentColor,
              onPressed: () {
                Navigator.of(context).pushNamed(AuthScreen.route);
              },
              child: Text(
                'Войти или зарегистрироваться',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
