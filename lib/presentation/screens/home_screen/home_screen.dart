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
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('TurnaTV')),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 12.0),
        child: Column(
          children: <Widget>[
            SizedBox(height: 12.0),
            BannersCarousel(),
            MovieHorizontalList(title: 'Новинки'),
            MovieHorizontalList(title: 'Рекомендованные'),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                blurRadius: 20,
                color: Colors.black.withOpacity(
                  .1,
                ))
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
              gap: 8,
              activeColor: Colors.white,
              iconSize: 24,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              duration: Duration(milliseconds: 800),
              tabBackgroundColor: Theme.of(context).accentColor,
              tabs: [
                GButton(
                  icon: LineAwesomeIcons.home,
                  text: 'Главная',
                ),
                GButton(
                  icon: LineAwesomeIcons.folder,
                  text: 'Категории',
                ),
                GButton(
                  icon: LineAwesomeIcons.search,
                  text: 'Поиск',
                ),
                GButton(
                  icon: LineAwesomeIcons.user,
                  text: 'Профиль',
                ),
              ],
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
