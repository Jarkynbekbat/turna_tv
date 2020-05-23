import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/home_bloc/home_bloc.dart';

class ErrorScreen extends StatelessWidget {
  final String message;

  const ErrorScreen(this.message);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(message, textAlign: TextAlign.center),
            IconButton(
              icon: Icon(Icons.refresh, size: 35.0),
              onPressed: () {
                context.bloc<HomeBloc>().add(FetchHomeScreenData());
              },
            )
          ],
        ),
      ),
    );
  }
}
