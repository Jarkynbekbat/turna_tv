part of 'registration_bloc.dart';

@immutable
abstract class RegistrationEvent {}

class Agree extends RegistrationEvent {}

class Registrate extends RegistrationEvent {
  final String login;
  final String password;
  final RegistrationType type;
  Registrate({
    @required this.login,
    @required this.password,
    @required this.type,
  });
}
