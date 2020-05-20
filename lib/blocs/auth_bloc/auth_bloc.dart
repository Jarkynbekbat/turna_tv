import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../data/repositories/repository.dart';

import '../../data/models/item_models/user.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  Repository _repository;
  AuthBloc(this._repository);

  @override
  AuthState get initialState => AuthInitial();

  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
    //Поставить реальную проверку
    if (event is CheckUser) yield AuthLogedOut();
    if (event is LoginByEmail) yield* _mapLoginByEmailToState(event);
  }

  Stream<AuthState> _mapLoginByEmailToState(LoginByEmail event) async* {
    try {
      yield AuthLoading();
      await _repository.initUserByEmail(event.email, event.password);
      yield AuthLogedIn(user: _repository.user);
    } catch (ex) {
      yield AuthError(message: ex.toString());
    }
  }
}
