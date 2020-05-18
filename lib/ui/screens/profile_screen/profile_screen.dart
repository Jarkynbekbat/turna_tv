import 'package:flutter/material.dart';

import '../../widgets/my_flat_button.dart';
import '../auth_screen/auth_screen.dart';
import '../information_screen/information_screen.dart';
import '../paymant_screen/paymant_screen.dart';
import 'widgets/grid_button.dart';
import 'widgets/info_block.dart';

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
          InfoBlock(
            title: 'Подписка',
            subtitle: 'Подключить',
            onClick: () => _toPaymant(context),
          ),
          SizedBox(height: 10.0),
          InfoBlock(
            title: 'Счет Turna',
            subtitle: '0 сом',
            onClick: () => _toPaymant(context),
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
                onClick: () => _toHelp(context),
              ),
              SizedBox(width: 10.0),
              GridButton(
                title: 'О нас',
                iconData: Icons.info,
                onClick: () => _toAboutUs(context),
              ),
            ],
          ),
          SizedBox(height: 20.0),
          MyFlatButton(
            title: 'Войти или зарегистрироваться',
            onClick: () => Navigator.of(context).pushNamed(AuthScreen.route),
          )
        ],
      ),
    );
  }

  void _toPaymant(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => PaymentScreen(),
      ),
    );
  }

  void _toHelp(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => InformationScreen(title: 'Помощь', content: help),
      ),
    );
  }

  void _toAboutUs(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) =>
            InformationScreen(title: 'О нас', content: aboutUs),
      ),
    );
  }

  final String aboutUs = ''' О нас  ''';

  final String help = ''' Помощь  ''';
}
