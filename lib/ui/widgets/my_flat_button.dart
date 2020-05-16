import 'package:flutter/material.dart';

class MyFlatButton extends StatelessWidget {
  final String title;
  final Function onClick;

  const MyFlatButton({this.title, this.onClick});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: FlatButton(
        color: Theme.of(context).accentColor,
        onPressed: onClick,
        child: Text(
          title,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
