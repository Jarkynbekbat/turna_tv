part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class CheckUser extends AuthEvent {}

class AddWatchLaterMovie extends AuthEvent {
  final Movie movie;
  AddWatchLaterMovie({
    @required this.movie,
  });
}

class LoginByEmail extends AuthEvent {
  final String email;
  final String password;

  LoginByEmail({@required this.email, @required this.password});
}

class LoginByGoogle extends AuthEvent {
  final GoogleSignInAccount account;
  LoginByGoogle({@required this.account});
}

class Logout extends AuthEvent {}
