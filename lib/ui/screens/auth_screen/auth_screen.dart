import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:turna_tv/ui/screens/profile_screen/profile_screen.dart';

import '../../../blocs/auth_bloc/auth_bloc.dart';
import '../../widgets/my_flat_button.dart';
import '../../widgets/screen_loading.dart';
import '../profile_screen/widgets/error_dialog.dart';
import '../registration_screen/registration_screen.dart';

class AuthScreen extends StatefulWidget {
  static String route = "auth";

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  TextEditingController _controller = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Вход или регистрация'),
      ),
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthError) showErrorDialog(context, state.message);
          if (state is AuthLogedIn) _listenLogedIn(context);
          if (state is AuthNeedRegistration) _listenNeedRegist(context, state);
        },
        child: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            if (state is AuthLoading) return ScreenLoading();
            return _buildDefault();
          },
        ),
      ),
    );
  }

  void _listenLogedIn(BuildContext context) {
    Navigator.of(context).pop();
  }

  Widget _buildDefault() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(22.0),
        child: Column(
          children: <Widget>[
            SizedBox(height: 70.0),
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
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: "пароль",
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
    );
  }

  void _listenNeedRegist(BuildContext context, AuthNeedRegistration state) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => RegistrationScreen(
            login: state.login, type: RegistrationType.email),
      ),
    );
  }

  void _onContinue(BuildContext context) {
    String email = _controller.text;
    String password = _passwordController.text;
    context
        .bloc<AuthBloc>()
        .add(LoginByEmail(email: email, password: password));

    // Navigator.of(context).push(
    //   MaterialPageRoute(
    //     builder: (context) => RegistrationScreen(data: null, type: null),
    //   ),
    // );
  }
}
