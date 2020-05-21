import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/auth_bloc/auth_bloc.dart';
import '../../../blocs/home_bloc/home_bloc.dart';
import '../../widgets/error_screen.dart';
import '../../widgets/movie_horizontal_list.dart';
import '../../widgets/screen_loading.dart';
import 'widgets/banners_carousel.dart';
import 'widgets/my_sliver_app_bar.dart';

class HomeScreen extends StatefulWidget {
  static String route = 'home';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeBloc, HomeState>(
      listener: (context, state) {
        if (state is HomeLoaded) _listenLoaded();
      },
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is HomeInitial) _listenInitial(context);
          if (state is HomeLoaded) return _buildLoaded(state);
          if (state is HomeError) return ErrorScreen(state.message);
          return ScreenLoading();
        },
      ),
    );
  }

  Container _buildLoaded(HomeLoaded state) {
    List<Widget> lists = [
      MovieHorizontalList(
        title: 'Новинки',
        movies: state.model.getNewMovies(),
      ),
      MovieHorizontalList(
        title: 'Рекомендванные',
        movies: state.model.getRecomendedMovies(),
      ),
      MovieHorizontalList(
        title: 'Детям',
        movies: state.model.getMoviesForChildren(),
      ),
    ];

    return Container(
      child: CustomScrollView(
        slivers: <Widget>[
          MySliberAppBar(
            height: MediaQuery.of(context).size.width * 0.6,
            flexibleSpace: BannersCarousel(
              movies: state.model.getMoviesForSlider(),
            ),
          ),
          SliverFixedExtentList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return lists[index];
              },
              childCount: lists.length,
            ),
            itemExtent: 250.0,
          ),
        ],
      ),
    );
  }

  void _listenInitial(BuildContext context) {
    context.bloc<HomeBloc>().add(FetchHomeScreenData());
  }

  void _listenLoaded() {
    context.bloc<AuthBloc>().add(CheckUser());
  }
}
