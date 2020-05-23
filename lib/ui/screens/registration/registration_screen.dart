import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/auth_bloc/auth_bloc.dart';
import '../../../blocs/registration_bloc/registration_bloc.dart';
import '../../widgets/my_flat_button.dart';
import '../../widgets/screen_loading.dart';
import '../information/information_screen.dart';
import '../profile/widgets/error_dialog.dart';
import 'widget/agreements.dart';

enum RegistrationType { phone, email, google, facebook }

class RegistrationScreen extends StatelessWidget {
  final String login;
  final RegistrationType type;
  RegistrationScreen({@required this.login, @required this.type});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Регистрация"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: BlocListener<RegistrationBloc, RegistrationState>(
            listener: (context, state) {
              if (state is RegistrationError)
                showErrorDialog(context, state.message);
              if (state is RegistrationCompleted) _listenCompleted(context);
            },
            child: BlocBuilder<RegistrationBloc, RegistrationState>(
              builder: (context, state) {
                if (state is RegistrationLoading) return ScreenLoading();
                if (state is RegistrationInitial)
                  return _buildAgreement(context, login);
                if (state is RegistrationAgreed)
                  return _buildPasswordPart(context, login, type);

                return _buildAgreement(context, login);
              },
            ),
          ),
        ));
  }

  void _listenCompleted(BuildContext context) async {
    context.bloc<AuthBloc>().add(CheckUser());
    Navigator.of(context).pop();
  }

  _buildAgreement(context, login) {
    _showContent(String title, String content, BuildContext context) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) =>
              InformationScreen(title: title, content: content),
        ),
      );
    }

    return Column(
      children: <Widget>[
        Text(
          'Для регистрации нам необходимо ваше согласие с правами и документами сервиса',
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 50.0),
        ListTile(
          leading: Icon(Icons.description),
          title: Text(
            'Политика конфиденциальности',
            style: Theme.of(context).textTheme.bodyText2,
          ),
          subtitle: Text(
            'об использовании сервисом персональных данных',
          ),
          trailing: Icon(Icons.arrow_forward),
          onTap: () => _showContent(
              'Политика конфиденциальности', privacyPolitic, context),
        ),
        SizedBox(height: 20.0),
        ListTile(
          leading: Icon(Icons.description),
          title: Text(
            'Пользовательское соглашение',
            style: Theme.of(context).textTheme.bodyText2,
          ),
          subtitle: Text('о пользовании сервисом'),
          trailing: Icon(Icons.arrow_forward),
          onTap: () => _showContent(
              'Пользовательское соглашение', userAgreement, context),
        ),
        SizedBox(height: 20.0),
        MyFlatButton(
          title: 'Прочитано, соглашаюсь',
          onClick: () {
            BlocProvider.of<RegistrationBloc>(context).add(Agree());
          },
        ),

        // Container(
        //   width: double.infinity,
        //   color: Theme.of(context).primaryColor.withOpacity(0.3),
        //   padding: EdgeInsets.all(8.0),
        //   child: Column(
        //     crossAxisAlignment: CrossAxisAlignment.start,
        //     children: <Widget>[
        //       Text(
        //         'Подтвердите email для завершения регистрации',
        //         style: TextStyle(
        //           fontSize: 18.0,
        //           color: Colors.white,
        //           fontWeight: FontWeight.bold,
        //         ),
        //       ),
        //       SizedBox(height: 20.0),
        //       Text(
        //         'Перейдя по ссылке из письма,чтобы подтвердить правильность указанного email',
        //         style: TextStyle(
        //           color: Colors.white.withOpacity(0.5),
        //           fontSize: 15.0,
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
        // SizedBox(height: 20.0),
        // MyFlatButton(
        //   title: 'Продолжить',
        //   onClick: () {},
        // ),
      ],
    );
  }

  _buildPasswordPart(context, login, type) {
    bool isValid(String password, String password2) {
      if (password != password2) return false;
      if (password.length < 6) return false;
      return true;
    }

    TextEditingController _controller = TextEditingController();
    TextEditingController _confirmController = TextEditingController();

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(height: 20.0),
          Container(
            width: double.infinity,
            color: Theme.of(context).primaryColor.withOpacity(0.3),
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Придумайте пароль для входа',
                  style: const TextStyle(
                    fontSize: 18.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20.0),
                Text(
                  'установите пароль для входа через email минимум 6 символов',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.5),
                    fontSize: 15.0,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20.0),
          TextField(
            controller: _controller,
            obscureText: true,
            decoration: InputDecoration(
              labelText: "придумайте пароль",
            ),
          ),
          SizedBox(height: 20.0),
          TextField(
            controller: _confirmController,
            obscureText: true,
            decoration: InputDecoration(
              labelText: "подтвердите пароль",
            ),
          ),
          SizedBox(height: 20.0),
          MyFlatButton(
            title: 'Продолжить',
            onClick: () {
              String password = _controller.text;
              String password2 = _confirmController.text;
              if (isValid(password, password2))
                BlocProvider.of<RegistrationBloc>(context).add(
                    Registrate(login: login, password: password, type: type));
              else
                showErrorDialog(context, 'Убедитесь в правильности ввода');
            },
          ),
        ],
      ),
    );
  }
}
