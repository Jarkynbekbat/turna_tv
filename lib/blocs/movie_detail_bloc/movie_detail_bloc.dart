import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../data/models/item_models/movie.dart';
import '../../data/repositories/repository.dart';

part 'movie_detail_event.dart';
part 'movie_detail_state.dart';

class MovieDetailBloc extends Bloc<MovieDetailEvent, MovieDetailState> {
  Repository _repository;
  MovieDetailBloc(this._repository);
  @override
  MovieDetailState get initialState => MovieDetailInitial();

  @override
  Stream<MovieDetailState> mapEventToState(
    MovieDetailEvent event,
  ) async* {
    if (event is AddToWatchLaterEvent) yield* _mapAddWatchLater(event);
    if (event is RemoveFromWatchLaterEvent) yield* _mapRemoveWatchLater(event);
  }

  Stream<MovieDetailState> _mapAddWatchLater(
      AddToWatchLaterEvent event) async* {
    bool isContains = _repository.user.watchLaterMovies
        .map((m) => m.id)
        .contains(event.movie.id);
    if (!isContains) {
      await _repository.addWatchLaterMovie(event.movie.id);
      yield MovieDetailWatchLaterAdded();
    } else {
      yield MovieDetailError(
          message: "Фильм уже добавлен в раздел смотреть позже");
    }
  }

  Stream<MovieDetailState> _mapRemoveWatchLater(
      RemoveFromWatchLaterEvent event) async* {
    try {
      await _repository.removeWatchLaterMovie(event.movie.id);
      yield MovieDetailWatchLaterRemoved();
    } catch (ex) {
      yield MovieDetailError(message: ex.toString());
    }
  }

  bool hasMovieInWatchLater(int movieId) {
    if (_repository.user.watchLaterMovies.isNotEmpty)
      return _repository.user.watchLaterMovies
          .map((m) => m.id)
          .contains(movieId);
    else
      return false;
  }
}
