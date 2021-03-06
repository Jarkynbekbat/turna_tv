part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final HomeScreenModel model;
  HomeLoaded({@required this.model});
}

class HomeError extends HomeState {
  final String message;
  HomeError({@required this.message});
}
