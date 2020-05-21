import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:turna_tv/data/providers/services/local_user_service.dart';

import '../../data/models/item_models/user.dart';
import '../../data/repositories/repository.dart';

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
    if (event is CheckUser) yield* _mapCheckUserToState();
    if (event is LoginByEmail) yield* _mapLoginByEmailToState(event);
    if (event is Logout) yield* _mapLogoutToState();
  }

  Stream<AuthState> _mapLogoutToState() async* {
    _repository.user = null;
    await LocalUserService.deleteUser();
    yield AuthLogedOut();
  }

  Stream<AuthState> _mapCheckUserToState() async* {
    try {
      User user = _repository.user;
      print('object');
      if (user == null)
        yield AuthLogedOut();
      else
        yield AuthLogedIn(user: user);
    } catch (e) {
      yield AuthError(message: e.toString());
    }
  }

  Stream<AuthState> _mapLoginByEmailToState(LoginByEmail event) async* {
    try {
      yield AuthLoading();
      await _repository.initUserByEmail(event.email, event.password);

      print('object');
      yield AuthLogedIn(user: _repository.user);
    } catch (ex) {
      if (ex.message == 488)
        yield AuthNeedRegistration();
      else if (ex.message == 401)
        yield AuthError(message: 'Не правильный логин или пароль');
      else
        yield AuthError(message: 'Что то пошло не так.. попробуйте снова..');
    }
  }

  bool isUserActive() {
    if (_repository.user == null) return false;
    if (!_repository.user.isActive) return false;
    return true;
  }
}
