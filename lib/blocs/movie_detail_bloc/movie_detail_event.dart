part of 'movie_detail_bloc.dart';

@immutable
abstract class MovieDetailEvent {}

class AddToWatchLaterEvent extends MovieDetailEvent {
  final Movie movie;
  AddToWatchLaterEvent({@required this.movie});
}

class RemoveFromWatchLaterEvent extends MovieDetailEvent {
  final Movie movie;
  RemoveFromWatchLaterEvent({@required this.movie});
}
