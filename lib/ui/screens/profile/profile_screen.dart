import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/auth_bloc/auth_bloc.dart';
import '../../../data/models/item_models/user.dart';
import '../../widgets/error_screen.dart';
import '../../widgets/my_flat_button.dart';
import '../../widgets/screen_loading.dart';
import '../auth/auth_screen.dart';
import '../information/information_screen.dart';
import '../movie_grid/movie_grid_screen.dart';
import '../paymant/paymant_webview_screen.dart';
import 'widgets/grid_button.dart';
import 'widgets/info.dart';
import 'widgets/info_block.dart';
import 'widgets/info_dialog.dart';
import 'widgets/makesure_dialog.dart';

class ProfileScreen extends StatelessWidget {
  static String route = "profile_screen";

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is AuthInitial) _listenInitial(context);
        if (state is AuthLogedOut) return _buildLogedOut(context);
        if (state is AuthLogedIn) return _buildLogedIn(context, state.user);
        if (state is AuthError) return ErrorScreen(state.message);
        if (state is AuthDetailError) _listenInitial(context);
        return ScreenLoading();
      },
    );
  }

  void _listenInitial(BuildContext context) {
    context.bloc<AuthBloc>().add(CheckUser());
  }

  Widget _buildLogedIn(BuildContext context, User user) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 30.0),
            InfoBlock(
              title: 'Профиль',
              subtitle: user.name,
              onClick: () {},
            ),
            SizedBox(height: 10.0),
            InfoBlock(
              title: 'Подписка',
              subtitle: !user.isActive
                  ? 'действует до ${user.isActiveBefore.toLocal()}'
                  : 'Подключить',
              onClick: !user.isActive ? () {} : () => _toPaymant(context),
            ),
            SizedBox(height: 10.0),
            SizedBox(height: 20.0),
            Row(
              children: <Widget>[
                GridButton(
                  title: 'Смотреть позже',
                  iconData: Icons.turned_in_not,
                  onClick: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => MovieGridScreen(
                          title: 'Смотреть позже',
                          movies: user.watchLaterMovies,
                        ),
                      ),
                    );
                  },
                ),
                SizedBox(width: 10.0),
                GridButton(
                  title: 'Просмотры',
                  iconData: Icons.access_time,
                  onClick: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => MovieGridScreen(
                          title: 'Просмотры',
                          movies: user.watchLaterMovies,
                        ),
                      ),
                    );
                  },
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
              title: 'Выйти',
              onClick: () async {
                bool res = await showMakesureDialog(
                    context, 'Вы уверены что хотите выйти ?');
                if (res) {
                  context.bloc<AuthBloc>().add(Logout());
                }
              },
            )
          ],
        ),
      ),
    );
  }

  Widget _buildLogedOut(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 10.0),
          SizedBox(height: 20.0),
          InfoBlock(
            title: 'Подписка',
            subtitle: 'подключить',
            onClick: () {
              showInfoDialog(
                  context, 'данный раздел доступен только после авторизации');
            },
          ),
          SizedBox(height: 10.0),
          SizedBox(height: 20.0),
          Row(
            children: <Widget>[
              GridButton(
                title: 'Смотреть позже',
                iconData: Icons.turned_in_not,
                onClick: () {
                  showInfoDialog(context,
                      'данный раздел доступен только после авторизации');
                },
              ),
              SizedBox(width: 10.0),
              GridButton(
                title: 'Просмотры',
                iconData: Icons.access_time,
                onClick: () {
                  showInfoDialog(context,
                      'данный раздел доступен только после авторизации');
                },
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
        builder: (context) => PaymantWebviewScreen(),
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
}
