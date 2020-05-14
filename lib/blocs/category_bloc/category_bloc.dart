import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../data/models/screen_models/category.dart';
import '../../data/repositories/repository.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  Repository _repository;
  CategoryBloc(this._repository);

  @override
  CategoryState get initialState => CategoryInitial();

  @override
  Stream<CategoryState> mapEventToState(
    CategoryEvent event,
  ) async* {
    if (event is FetchCategoryScreenData) yield* _fetchToState();
  }

  Stream<CategoryState> _fetchToState() async* {
    yield CategoryLoading();
    try {
      var model = CategoryScreenModel(
        categories: _repository.categories,
        movies: _repository.movies,
        genres: _repository.genres,
      );
      yield CategoryLoaded(model: model);
    } catch (e) {
      print('object');
      yield CategoryError(error: e);
    }
  }
}
