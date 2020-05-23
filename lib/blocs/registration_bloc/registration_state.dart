part of 'registration_bloc.dart';

@immutable
abstract class RegistrationState {}

class RegistrationInitial extends RegistrationState {}

class RegistrationAgreed extends RegistrationState {}

class RegistrationLoading extends RegistrationState {}

class RegistrationCompleted extends RegistrationState {}

class RegistrationError extends RegistrationState {
  final String message;
  RegistrationError({@required this.message});
}
