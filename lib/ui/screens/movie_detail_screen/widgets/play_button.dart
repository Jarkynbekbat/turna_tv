import 'package:flutter/material.dart';
import '../../video_player_screen/video_player.dart';

class PlayButton extends StatelessWidget {
  final String title;
  final String movieTitle;
  final Icon icon;
  final String url;

  const PlayButton({
    @required this.movieTitle,
    @required this.title,
    @required this.icon,
    @required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200.0,
      child: ListTile(
        leading: icon,
        title: Text(title),
      ),

      // FlatButton(
      //   color: Theme.of(context).accentColor,
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //     children: <Widget>[icon, Text(title),],
      //   ),
      //   onPressed: () {
      //     Navigator.of(context).push(MaterialPageRoute(
      //       builder: (context) => VideoPlayerPage(title: movieTitle, url: url),
      //     ));
      //   },
      // ),
    );
  }
}
