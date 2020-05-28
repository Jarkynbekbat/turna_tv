part of 'registration_bloc.dart';

@immutable
abstract class RegistrationEvent {}

class Agree extends RegistrationEvent {}

class Registrate extends RegistrationEvent {
  final String login;
  final String password;
  final GoogleSignInAccount account;

  final RegistrationType type;
  Registrate({
    this.login,
    this.password,
    this.account,
    @required this.type,
  });
}
