import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../blocs/auth_bloc/auth_bloc.dart';
import '../../../blocs/registration_bloc/registration_bloc.dart';
import '../../widgets/my_flat_button.dart';
import '../information/information_screen.dart';
import 'registration_screen.dart';
import 'widget/agreements.dart';

class SocialAccauntRegistrationScreen extends StatelessWidget {
  final GoogleSignInAccount googleSignInAccount;

  const SocialAccauntRegistrationScreen({
    this.googleSignInAccount,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Регистрация '),
      ),
      body: BlocListener<RegistrationBloc, RegistrationState>(
        listener: (context, state) {
          if (state is RegistrationCompleted) _listenCompleted(context);
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
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
                title: 'соглашаюсь,продолжить',
                onClick: () => _onContinue(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _listenCompleted(BuildContext context) async {
    print('object');
    context.bloc<AuthBloc>().add(CheckUser());
    Navigator.of(context).pop();
  }

  void _onContinue(BuildContext context) {
    BlocProvider.of<RegistrationBloc>(context).add(
      Registrate(
        account: googleSignInAccount,
        type: RegistrationType.google,
      ),
    );
  }

  _showContent(String title, String content, BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => InformationScreen(title: title, content: content),
      ),
    );
  }
}
