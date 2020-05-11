import 'package:first_time_screen/first_time_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/home_bloc/home_bloc.dart';
import 'data/repositories/repository.dart';
import 'presentation/screens/auth_screen/auth_screen.dart';
import 'presentation/screens/home_screen/home_screen.dart';
import 'presentation/screens/intro_screen/intro_screen.dart';
import 'presentation/screens/main_screen/main_screen.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Repository repository = Repository();
    return MaterialApp(
      routes: <String, WidgetBuilder>{
        AuthScreen.route: (context) => AuthScreen(),
        HomeScreen.route: (context) => HomeScreen(),
      },
      home: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => HomeBloc(repository)),
          // BlocProvider(create: (context) => AuthBloc()),
        ],
        child: FirstTimeScreen(
          introScreen: MaterialPageRoute(
            builder: (context) => IntroScreen(),
          ),
          landingScreen: MaterialPageRoute(
            builder: (context) => MainScreen(),
          ),
        ),
      ),
    );
  }
}
