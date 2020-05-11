import 'package:flutter/material.dart';

class PlayButton extends StatelessWidget {
  final String title;
  final Icon icon;
  final Function onTab;

  const PlayButton({
    @required this.title,
    @required this.icon,
    @required this.onTab,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 140.0,
      child: FlatButton(
        color: Theme.of(context).accentColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[icon, Text(title)],
        ),
        onPressed: onTab,
      ),
    );
  }
}
