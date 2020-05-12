import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:turna_tv/presentation/screens/main_screen/widgets/my_sliver_app_bar.dart';

import '../../../blocs/home_bloc/home_bloc.dart';
import '../../widgets/loading_screen.dart';
import '../../widgets/movie_horizontal_list.dart';
import 'widgets/banners_carousel.dart';

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
        if (state is HomeError) return _buildError(state);
        return LoadingScreen();
      },
    );
  }

  Center _buildError(HomeError state) {
    return Center(child: Text(state.error.toString()));
  }

  Container _buildLoaded(HomeLoaded state) {
    return Container(
      child: CustomScrollView(
        slivers: <Widget>[
          MySliberAppBAr(
            height: MediaQuery.of(context).size.width * 0.6,
            flexibleSpace: BannersCarousel(
              movies: state.model.getMoviesForSlider(),
            ),
          ),
          SliverFixedExtentList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return MovieHorizontalList(
                  title: 'Новинки',
                  movies: state.model.getNewMovies(),
                );
              },
              childCount: 3,
            ),
            itemExtent: 303,
          ),
        ],
      ),
    );

    // Card(
    //   child: ListView(
    //     children: <Widget>[
    //       SizedBox(height: 12.0),
    //       BannersCarousel(
    //         movies: state.model.getMoviesForSlider(),
    //       ),
    // MovieHorizontalList(
    //   title: 'Новинки',
    //   movies: state.model.getNewMovies(),
    // ),
    //       MovieHorizontalList(
    //         title: 'Рекомендванные',
    //         movies: state.model.getRecomendedMovies(),
    //       ),
    //       MovieHorizontalList(
    //         title: 'Детям',
    //         movies: state.model.getMoviesForChildren(),
    //       ),
    //     ],
    //   ),
    // );
  }

  void _listenInitial(BuildContext context) {
    context.bloc<HomeBloc>().add(FetchHomeScreenData());
  }
}
