import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:turna_tv/data/models/item_models/movie.dart';

import '../../data/models/screen_models/home.dart';
import '../../data/repositories/repository.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  Repository _repository;
  HomeBloc(this._repository);

  @override
  HomeState get initialState => HomeInitial();

  @override
  Stream<HomeState> mapEventToState(
    HomeEvent event,
  ) async* {
    if (event is FetchHomeScreenData) yield* _fetchToState();
  }

  List<Movie> getMoviesByPersonId(int id) {
    try {
      return _repository.movies
          .where((m) => m.people.map((p) => p.peopleId).contains(id))
          .toList();
    } catch (ex) {
      return [];
    }
  }

  Stream<HomeState> _fetchToState() async* {
    yield HomeLoading();
    try {
      await _repository.initAll();
      print('object');

      yield HomeLoaded(model: HomeScreenModel(movies: _repository.movies));
    } catch (e) {
      String message;
      if (e is SocketException)
        message = "Проверьте интернет соединение и попробуйте снова";

      print('object');
      yield HomeError(message: message);
    }
  }
}
