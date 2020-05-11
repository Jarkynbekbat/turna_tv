import 'package:flutter/material.dart';
import 'package:turna_tv/presentation/screens/home_screen/home_screen.dart';

import '../../widgets/bottom_navigation.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final List<Widget> tabs = [
    HomeScreen(),
    Text('Категории'),
    Text('Поиск'),
    Text('Профиль'),
  ];
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TurnaTV'),
      ),
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

class AuthBloc {}
