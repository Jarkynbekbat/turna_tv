import 'package:flutter/material.dart';

import '../../main/main_screen.dart';
import '../../video_player/video_player.dart';

class PlayButton extends StatelessWidget {
  final String title;
  final String movieTitle;
  final IconData iconData;
  final String url;
  final bool isAllowed;

  const PlayButton({
    @required this.movieTitle,
    @required this.title,
    @required this.iconData,
    @required this.url,
    @required this.isAllowed,
  });

  @override
  Widget build(BuildContext context) {
    final titleStyle =
        Theme.of(context).textTheme.bodyText1.copyWith(color: Colors.white);
    final iconColor =
        Theme.of(context).textTheme.bodyText1.color.withOpacity(1);

    return MaterialButton(
      minWidth: MediaQuery.of(context).size.width / 100 * 35,
      color: Theme.of(context).accentColor,
      onPressed:
          isAllowed ? () => _playVideo(context) : () => _goToProfile(context),
      child: Row(
        children: <Widget>[
          Icon(iconData, color: iconColor),
          Text(title, style: titleStyle),
        ],
      ),
    );
  }

  void _playVideo(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => VideoPlayerPage(title: movieTitle, url: url),
    ));
  }

  void _goToProfile(BuildContext context) {
    Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (context) => MainScreen(index: 3),
    ));
  }
}
