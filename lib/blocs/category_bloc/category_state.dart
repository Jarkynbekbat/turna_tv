part of 'category_bloc.dart';

@immutable
abstract class CategoryState {}

class CategoryInitial extends CategoryState {}

class CategoryLoading extends CategoryState {}

class CategoryLoaded extends CategoryState {
  final CategoryScreenModel model;
  CategoryLoaded({@required this.model});
}

class CategoryError extends CategoryState {
  final Error error;
  CategoryError({@required this.error});
}
