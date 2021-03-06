import 'package:first_time_screen/first_time_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:turna_tv/blocs/movie_detail_bloc/movie_detail_bloc.dart';

import 'app_config.dart';
import 'blocs/auth_bloc/auth_bloc.dart';
import 'blocs/category_bloc/category_bloc.dart';
import 'blocs/home_bloc/home_bloc.dart';
import 'blocs/registration_bloc/registration_bloc.dart';
import 'blocs/search_bloc/search_bloc.dart';
import 'data/repositories/repository.dart';
import 'ui/screens/intro/intro_screen.dart';
import 'ui/screens/main/main_screen.dart';
import 'ui/widgets/splash_screen.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => Repository(),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => SearchBloc(context.repository<Repository>()),
          ),
          BlocProvider(
            create: (context) => CategoryBloc(context.repository<Repository>()),
          ),
          BlocProvider(
            create: (context) => HomeBloc(context.repository<Repository>()),
          ),
          BlocProvider(
            create: (context) => AuthBloc(context.repository<Repository>()),
          ),
          BlocProvider(
            create: (context) =>
                RegistrationBloc(context.repository<Repository>()),
          ),
          BlocProvider(
            create: (context) =>
                MovieDetailBloc(context.repository<Repository>()),
          ),
        ],
        child: MaterialApp(
          theme: getTheme(),
          home: FirstTimeScreen(
            loadingScreen: SplashScreen(),
            introScreen: MaterialPageRoute(
              builder: (context) => IntroScreen(),
            ),
            landingScreen: MaterialPageRoute(
              builder: (context) => MainScreen(),
            ),
          ),
          routes: getRoutes(),
        ),
      ),
    );
  }
}
