import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:flappy_search_bar/scaled_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../blocs/search_bloc/search_bloc.dart';
import '../../widgets/error_screen.dart';
import '../../widgets/loading_screen.dart';
import '../../../data/models/item_models/movie.dart';
import '../../widgets/movie_card.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final SearchBarController<Movie> _searchBarController = SearchBarController();
  bool isReplay = false;

  Future<List<Movie>> _search(String text, List<Movie> movies) async {
    return movies;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        if (state is SearchInitial) _listenInitial(context);
        if (state is SearchLoaded) return _buildLoaded(state);
        if (state is SearchError) return ErrorScreen(state.error.toString());
        return LoadingScreen();
      },
    );
  }

  void _listenInitial(BuildContext context) {
    context.bloc<SearchBloc>().add(FetchSearchSreenData());
  }

  SafeArea _buildLoaded(SearchLoaded state) {
    return SafeArea(
      child: SearchBar<Movie>(
        searchBarPadding: EdgeInsets.symmetric(horizontal: 10),
        headerPadding: EdgeInsets.symmetric(horizontal: 10),
        listPadding: EdgeInsets.symmetric(horizontal: 10),
        onSearch: (title) => _search(title, state.model.movies),
        searchBarController: _searchBarController,
        placeHolder: Text("placeholder"),
        cancellationWidget: Text("Cancel"),
        emptyWidget: Text("empty"),
        indexedScaledTileBuilder: (int index) =>
            ScaledTile.count(1, index.isEven ? 2 : 1),
        onCancelled: () {
          print("Cancelled triggered");
        },
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        crossAxisCount: 2,
        onItemFound: (Movie movie, int index) {
          return MovieCard(movie: movie);
        },
      ),
    );
  }
}
