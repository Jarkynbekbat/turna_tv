import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';

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
    return Card(
      child: ListView(
        children: <Widget>[
          SizedBox(height: 12.0),
          BannersCarousel(),
          MovieHorizontalList(title: 'Новинки'),
          MovieHorizontalList(title: 'Рекомендованные'),
        ],
      ),
    );
  }
}
