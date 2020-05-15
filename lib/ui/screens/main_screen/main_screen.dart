import 'package:flutter/material.dart';
import 'package:turna_tv/ui/screens/profile_screen/profile_screen.dart';

import '../../widgets/bottom_navigation.dart';
import '../category_screen/category_screen.dart';
import '../home_screen/home_screen.dart';
import '../search_screen/search_screen.dart';

class MainScreen extends StatefulWidget {
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
    return Scaffold(
      body: tabs[_currentIndex],
      bottomNavigationBar: BottomNavigation(
          currentIndex: _currentIndex,
          onSelect: (index) {
            setState(() {
              _currentIndex = index;
            });
          }),
    );
  }
}