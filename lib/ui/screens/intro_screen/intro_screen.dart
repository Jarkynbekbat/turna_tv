import 'package:flutter/material.dart';
import 'package:intro_views_flutter/Models/page_view_model.dart';
import 'package:intro_views_flutter/intro_views_flutter.dart';

import '../auth_screen/auth_screen.dart';

class IntroScreen extends StatefulWidget {
  static String route = "intro_screen";
  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  Widget build(BuildContext context) {
    return IntroViewsFlutter(
      [page, page2, page3],
      onTapDoneButton: () => Navigator.of(context).pushNamed(AuthScreen.route),
      showSkipButton: true,
      skipText:
          Text('ПРОПУСТИТЬ', style: TextStyle(fontWeight: FontWeight.bold)),
      doneText: Text('НАЧАТЬ', style: TextStyle(fontWeight: FontWeight.bold)),
      pageButtonTextStyles: TextStyle(
        color: Colors.white,
        fontSize: 18.0,
        fontFamily: "Regular",
      ),
    );
  }
}

final page = PageViewModel(
  pageColor: Colors.black,
  // iconImageAssetPath: 'assets/taxi-driver.png',
  iconColor: Colors.blue,
  bubbleBackgroundColor: Colors.red,
  body: Text(
    'Смотри новинки из мира кино одним из первых!',
  ),
  title: Text('Новинки кино'),
  mainImage: Image.asset(
    'assets/intro1.png',
    height: 285.0,
    width: 285.0,
    alignment: Alignment.center,
  ),
  textStyle: TextStyle(fontFamily: 'MyFont', color: Colors.white),
);

final page2 = PageViewModel(
  pageColor: Colors.black,
  // iconImageAssetPath: 'assets/taxi-driver.png',
  iconColor: Colors.blue,
  bubbleBackgroundColor: Colors.red,
  body: Text(
    'Самые популярные сериалы в хорошем качестве!',
  ),
  title: Text('Сериалы'),
  mainImage: Image.asset(
    'assets/intro2.png',
    height: 285.0,
    width: 285.0,
    alignment: Alignment.center,
  ),
  textStyle: TextStyle(fontFamily: 'MyFont', color: Colors.white),
);

final page3 = PageViewModel(
  pageColor: Colors.black,
  // iconImageAssetPath: 'assets/taxi-driver.png',
  iconColor: Colors.blue,
  bubbleBackgroundColor: Colors.red,
  body: Text(
    'Будь в курсе последних событий спорта!',
  ),
  title: Text('Спорт'),
  mainImage: Image.asset(
    'assets/intro3.png',
    height: 300.0,
    width: 300.0,
    alignment: Alignment.center,
  ),
  textStyle: TextStyle(fontFamily: 'MyFont', color: Colors.white),
);
