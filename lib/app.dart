import 'package:first_time_screen/first_time_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:turna_tv/blocs/search_bloc/search_bloc.dart';

import 'blocs/auth_bloc/auth_bloc.dart';
import 'blocs/category_bloc/category_bloc.dart';
import 'blocs/home_bloc/home_bloc.dart';
import 'data/repositories/repository.dart';
import 'ui/screens/auth_screen/auth_screen.dart';
import 'ui/screens/home_screen/home_screen.dart';
import 'ui/screens/intro_screen/intro_screen.dart';
import 'ui/screens/main_screen/main_screen.dart';
import 'ui/widgets/loading_screen.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => Repository(),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => SearchBloc(
              context.repository<Repository>(),
            ),
          ),
          BlocProvider(
            create: (context) => CategoryBloc(
              context.repository<Repository>(),
            ),
          ),
          BlocProvider(
            create: (context) => HomeBloc(
              context.repository<Repository>(),
            ),
          ),
          BlocProvider(
            create: (context) => AuthBloc(),
          ),
        ],
        child: MaterialApp(
          // theme: ThemeData.dark(),
          home: FirstTimeScreen(
            loadingScreen: LoadingScreen(),
            introScreen: MaterialPageRoute(
              builder: (context) => IntroScreen(),
            ),
            landingScreen: MaterialPageRoute(
              builder: (context) => MainScreen(),
            ),
          ),
          routes: <String, WidgetBuilder>{
            AuthScreen.route: (context) => AuthScreen(),
            HomeScreen.route: (context) => HomeScreen(),
          },
        ),
      ),
    );
  }
}
