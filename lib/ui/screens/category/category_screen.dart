import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/category_bloc/category_bloc.dart';
import '../../../data/models/item_models/movie.dart';
import '../../widgets/app_bar_title.dart';
import '../../widgets/error_screen.dart';
import '../../widgets/movie_card.dart';
import '../../widgets/screen_loading.dart';
import 'widgets/genre_choice_chips.dart';

class CategoryScreen extends StatefulWidget {
  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  String selectedGenre = 'все';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryBloc, CategoryState>(
      builder: (context, state) {
        if (state is CategoryInitial) _listenInitial(context);
        if (state is CategoryLoaded) return _buildLoaded(state);
        if (state is CategoryError) return ErrorScreen(state.error.toString());
        return ScreenLoading();
      },
    );
  }

  void _listenInitial(BuildContext context) {
    context.bloc<CategoryBloc>().add(FetchCategoryScreenData());
  }

  Widget _buildLoaded(CategoryLoaded state) {
    var tabs = state.model.categories.map((c) => Tab(text: c.title)).toList();

    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: AppBarTitle(),
          bottom: TabBar(
            tabs: tabs,
            isScrollable: true,
          ),
        ),
        body: TabBarView(
          children: List.generate(
            tabs.length,
            (i) => _buildTab(state.model.categories[i].id, state),
          ),
        ),
      ),
    );
  }

  Widget _buildTab(int categoryId, CategoryLoaded state) {
    var movies = <Movie>[];

    var genres = state.model
        .getGenresByCategoryId(categoryId)
        .map((e) => e.title)
        .toList();

    genres.insert(0, 'все');

    if (selectedGenre == 'все') {
      movies = state.model.getMoviesByCategoryId(categoryId);
    } else {
      movies = state.model
          .getMoviesByCategoryAndGenreName(categoryId, selectedGenre);
    }

    return Wrap(
      children: <Widget>[
        GenreChoiceChips(
          options: genres,
          value: selectedGenre,
          onChanged: (value) {
            setState(() {
              selectedGenre = value;
            });
          },
        ),
        Container(
          height: 450,
          child: GridView.count(
            padding: EdgeInsets.symmetric(horizontal: 12.0),
            crossAxisCount: 3,
            childAspectRatio: 0.95 / 1.4,
            children: List.generate(
              movies.length,
              (i) {
                return MovieCard(movie: movies[i]);
              },
            ),
          ),
        ),
      ],
    );
  }
}
