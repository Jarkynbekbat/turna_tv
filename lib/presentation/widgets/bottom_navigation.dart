import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';

class BottomNavigation extends StatelessWidget {
  final int currentIndex;
  final Function onSelect;

  const BottomNavigation({
    @required this.currentIndex,
    @required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(blurRadius: 20, color: Colors.black.withOpacity(.1))
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
              GButton(icon: LineAwesomeIcons.home, text: 'Главная'),
              GButton(icon: LineAwesomeIcons.folder, text: 'Категории'),
              GButton(icon: LineAwesomeIcons.search, text: 'Поиск'),
              GButton(icon: LineAwesomeIcons.user, text: 'Профиль'),
            ],
            selectedIndex: currentIndex,
            onTabChange: onSelect,
          ),
        ),
      ),
    );
  }
}
