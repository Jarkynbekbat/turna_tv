part of 'auth_bloc.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthNeedRegistration extends AuthState {
  final String email;
  final String phone;
  final String password;

  AuthNeedRegistration({
    this.email,
    this.phone,
    this.password,
  });
}

class AuthLogedIn extends AuthState {
  final User user;
  AuthLogedIn({@required this.user});
}

class AuthLogedOut extends AuthState {}

class AuthError extends AuthState {
  final String message;
  AuthError({this.message});
}
