import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/search_bloc/search_bloc.dart';
import '../../../data/models/item_models/movie.dart';
import '../../widgets/error_screen.dart';
import '../../widgets/movie_card.dart';
import '../../widgets/screen_loading.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final SearchBarController<Movie> _searchBarController = SearchBarController();
  bool isReplay = false;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        if (state is SearchInitial) _listenInitial(context);
        if (state is SearchLoaded) return _buildLoaded(state);
        if (state is SearchError) return ErrorScreen(state.error.toString());
        return ScreenLoading();
      },
    );
  }

  void _listenInitial(BuildContext context) {
    context.bloc<SearchBloc>().add(FetchSearchSreenData());
  }

  SafeArea _buildLoaded(SearchLoaded state) {
    return SafeArea(
      child: SearchBar<Movie>(
        textStyle: Theme.of(context).textTheme.bodyText1,
        iconActiveColor: Colors.white,
        icon: Icon(Icons.search,
            color: Theme.of(context).textTheme.bodyText2.color),
        searchBarPadding: EdgeInsets.symmetric(horizontal: 5),
        headerPadding: EdgeInsets.symmetric(horizontal: 10),
        listPadding: EdgeInsets.symmetric(horizontal: 10),
        onSearch: (title) => _search(title, state.model.movies),
        hintText: "название фильма",
        searchBarController: _searchBarController,
        // placeHolder:
        cancellationWidget: Text("Отмена"),
        emptyWidget: Text("Не найдено"),
        onCancelled: () {
          print("Cancelled triggered");
        },
        minimumChars: 1,
        crossAxisSpacing: 1,
        crossAxisCount: 3,
        onItemFound: _buildFoundItem,
      ),
    );
  }

  Widget _buildFoundItem(Movie movie, int index) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            height: 188,
            child: MovieCard(movie: movie),
          ),
          SizedBox(height: 10),
          Text(
            movie.title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Future<List<Movie>> _search(String text, List<Movie> movies) async {
    text = text.toLowerCase();
    if (text.length == 1) {
      return movies.where((el) => el.title.toLowerCase()[0] == text).toList();
    }
    if (text.length == 2) {
      return movies
          .where((el) =>
              el.title.toLowerCase()[0] == text[0] &&
              el.title.toLowerCase()[1] == text[1])
          .toList();
    }
    return movies.where((el) => el.title.toLowerCase().contains(text)).toList();
  }
}
