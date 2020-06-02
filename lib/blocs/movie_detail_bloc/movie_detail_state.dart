part of 'movie_detail_bloc.dart';

@immutable
abstract class MovieDetailState {}

class MovieDetailInitial extends MovieDetailState {}

class MovieDetailWatchLaterAdded extends MovieDetailState {}

class MovieDetailWatchLaterRemoved extends MovieDetailState {}

class MovieDetailError extends MovieDetailState {
  final String message;
  MovieDetailError({@required this.message});
}
