import 'package:flutter/material.dart';

class BottomNavigation extends StatelessWidget {
  final int currentIndex;
  final Function onSelect;

  const BottomNavigation({
    @required this.currentIndex,
    @required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Theme.of(context).primaryColor,
      selectedItemColor: Colors.white,
      unselectedItemColor:
          Theme.of(context).textTheme.bodyText1.color.withOpacity(0.5),
      selectedLabelStyle:
          TextStyle(fontSize: 15.0, fontWeight: FontWeight.normal),
      unselectedLabelStyle:
          TextStyle(fontSize: 15.0, fontWeight: FontWeight.normal),
      type: BottomNavigationBarType.fixed,
      currentIndex: currentIndex,
      onTap: onSelect,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          title: Text('Главная'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.folder),
          title: Text('Категории'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          title: Text('Поиск'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          title: Text('Профиль'),
        ),
      ],
    );
  }
}
