import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../data/repositories/repository.dart';
import '../../ui/screens/registration_screen/registration_screen.dart';

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
      await _repository.registrateUser(event.login, event.password, event.type);

      yield RegistrationCompleted();
    } catch (e) {
      yield RegistrationError(message: e.toString());
    }
  }
}
