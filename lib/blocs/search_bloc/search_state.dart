part of 'search_bloc.dart';

@immutable
abstract class SearchState {}

class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class SearchLoaded extends SearchState {
  final SearchScreenModel model;
  SearchLoaded({@required this.model});
}

class SearchError extends SearchState {
  final Error error;
  SearchError({@required this.error});
}
