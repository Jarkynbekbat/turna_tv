import 'package:flutter/material.dart';

class GridButton extends StatelessWidget {
  final String title;
  final IconData iconData;
  final Function onClick;
  const GridButton({
    Key key,
    @required this.title,
    @required this.iconData,
    @required this.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: MaterialButton(
        onPressed: onClick,
        color: Colors.grey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Icon(
                iconData,
                color: Colors.white,
              ),
              Text(
                title,
                style: TextStyle(color: Colors.white),
              )
            ],
          ),
        ),
      ),
    );
  }
}
