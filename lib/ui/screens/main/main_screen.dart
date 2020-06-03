import 'package:flutter/material.dart';

import '../../widgets/bottom_navigation.dart';
import '../category/category_screen.dart';
import '../home/home_screen.dart';
import '../profile/profile_screen.dart';
import '../search/search_screen.dart';

class MainScreen extends StatefulWidget {
  static String route = 'main_screen';
  int index;
  MainScreen({this.index});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final List<Widget> tabs = [
    HomeScreen(),
    CategoryScreen(),
    SearchScreen(),
    ProfileScreen(),
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    _currentIndex = widget.index ?? _currentIndex;
    return SafeArea(
      child: Scaffold(
        body: tabs[_currentIndex],
        bottomNavigationBar: BottomNavigation(
            currentIndex: _currentIndex,
            onSelect: (index) {
              setState(() {
                widget.index = null;
                _currentIndex = index;
              });
            }),
      ),
    );
  }
}
