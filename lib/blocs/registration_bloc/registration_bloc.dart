import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:meta/meta.dart';

import '../../data/repositories/repository.dart';
import '../../ui/screens/registration/registration_screen.dart';

part 'registration_event.dart';
part 'registration_state.dart';

class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  Repository _repository;
  RegistrationBloc(this._repository);

  @override
  RegistrationState get initialState => RegistrationInitial();

  @override
  Stream<RegistrationState> mapEventToState(
    RegistrationEvent event,
  ) async* {
    if (event is Agree) yield RegistrationAgreed();
    if (event is Registrate) yield* _mapRegistrateToState(event);
  }

  Stream<RegistrationState> _mapRegistrateToState(Registrate event) async* {
    try {
      if (event.type == RegistrationType.email)
        await _repository.registrateUser(
            login: event.login, password: event.password, type: event.type);
      else if (event.type == RegistrationType.google)
        await _repository.registrateUser(
            account: event.account, type: event.type);

      yield RegistrationCompleted();
    } catch (e) {
      yield RegistrationError(message: e.toString());
    }
  }
}
