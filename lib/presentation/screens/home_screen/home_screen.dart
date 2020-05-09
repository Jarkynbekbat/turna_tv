import 'package:flutter/material.dart';
import 'package:turna_tv/presentation/screens/home_screen/widgets/banners_carousel.dart';

import '../../widgets/movie_horizontal_list.dart';

// https://pub.dev/packages/carousel_slider
// https://pub.dev/packages/font_awesome_flutter
// https://pub.dev/packages/video_player
// https://pub.dev/packages/shimmer
// https://pub.dev/packages/animations

class HomeScreen extends StatelessWidget {
  static String route = 'home';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('TurnaTV')),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 12.0),
        child: Column(
          children: <Widget>[
            BannersCarousel(),
            MovieHorizontalList(title: 'Новинки'),
            MovieHorizontalList(title: 'Рекомендованные'),
          ],
        ),
      ),
    );
  }
}
