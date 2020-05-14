import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:turna_tv/ui/widgets/error_screen.dart';

import '../../../blocs/home_bloc/home_bloc.dart';
import '../../widgets/loading_screen.dart';
import '../../widgets/movie_horizontal_list.dart';
import 'widgets/banners_carousel.dart';
import 'widgets/my_sliver_app_bar.dart';

// https://pub.dev/packages/carousel_slider
// https://pub.dev/packages/font_awesome_flutter
// https://pub.dev/packages/video_player
// https://pub.dev/packages/shimmer
// https://pub.dev/packages/animations

class HomeScreen extends StatefulWidget {
  static String route = 'home';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state is HomeInitial) _listenInitial(context);
        if (state is HomeLoaded) return _buildLoaded(state);
        if (state is HomeError) return ErrorScreen(state.error.toString());
        return LoadingScreen();
      },
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
}
