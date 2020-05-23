import 'package:flutter/material.dart';

class InfoBlock extends StatelessWidget {
  final String title;
  final String subtitle;
  final Function onClick;

  const InfoBlock({this.title, this.subtitle, this.onClick});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Theme.of(context).primaryColor.withOpacity(0.3),
      padding: EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: const TextStyle(
              fontSize: 18.0,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20.0),
          GestureDetector(
            onTap: onClick,
            child: Text(
              subtitle,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
