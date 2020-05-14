import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:turna_tv/data/models/screen_models/search.dart';

import 'package:turna_tv/data/repositories/repository.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  Repository _repository;
  SearchBloc(this._repository);

  @override
  SearchState get initialState => SearchInitial();

  @override
  Stream<SearchState> mapEventToState(
    SearchEvent event,
  ) async* {
    if (event is FetchSearchSreenData) yield* _fetchToState();
  }

  Stream<SearchState> _fetchToState() async* {
    try {
      yield SearchLoading();
      var model = SearchScreenModel(movies: _repository.movies);
      yield SearchLoaded(model: model);
    } catch (e) {
      yield SearchError(error: e);
    }
  }
}
