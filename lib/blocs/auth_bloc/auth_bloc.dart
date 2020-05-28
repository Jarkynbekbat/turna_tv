import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:email_validator/email_validator.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:meta/meta.dart';

import '../../data/models/item_models/movie.dart';
import '../../data/models/item_models/user.dart';
import '../../data/providers/services/local_user_service.dart';
import '../../data/repositories/repository.dart';
import '../../ui/screens/registration/registration_screen.dart';

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
    if (event is AddWatchLaterMovie) yield* _mapAddWatchLater(event);
    if (event is LoginByGoogle) yield* _mapLoginByGoogleToState(event);
  }

  Stream<AuthState> _mapLoginByGoogleToState(LoginByGoogle event) async* {
    try {
      yield AuthLoading();
      await _repository.initUserGoogle(event.account);
      yield AuthLogedIn(user: _repository.user);
      print('ssd');
    } catch (e) {
      if (e.message[0] == 488) {
        print('ssd');
        yield AuthNeedRegistration(
            account: e.message[1], type: RegistrationType.google);
      } else
        yield AuthError(message: e.toString());
    }
  }

  Stream<AuthState> _mapAddWatchLater(AddWatchLaterMovie event) async* {
    bool isContains = _repository.user.watchLaterMovies
        .map((m) => m.id)
        .contains(event.movie.id);
    if (!isContains) {
      await _repository.addWatchLaterMovie(event.movie.id);
      yield AuthLogedIn(user: _repository.user);
    } else {
      yield AuthDetailError(
          message: "Фильм уже добавлен в раздел смотреть позже");
    }

    print('object');
  }

  Stream<AuthState> _mapLogoutToState() async* {
    _repository.user = null;
    await LocalUserService.deleteUser();
    yield AuthLogedOut();
  }

  Stream<AuthState> _mapCheckUserToState() async* {
    try {
      User user = _repository.user;
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

      if (EmailValidator.validate(event.email)) {
        yield AuthLoading();
        await _repository.initUserByEmail(event.email, event.password);
        yield AuthLogedIn(user: _repository.user);
      } else
        yield AuthError(message: 'Убедитесь в правильности ввода');
    } catch (e) {
      if (e.message == 401)
        yield AuthError(message: 'Не правильный логин или пароль');
      else if (e.message[0] == 488)
        yield AuthNeedRegistration(
            login: e.message[1],
            password: e.message[2],
            type: RegistrationType.email);
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
