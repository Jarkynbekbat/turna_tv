import 'package:flutter/material.dart';
import 'package:turna_tv/data/models/movie.dart';
import 'movie_card.dart';

class MovieHorizontalList extends StatelessWidget {
  final String title;
  final List<Movie> movies;
  MovieHorizontalList({@required this.title, @required this.movies});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              IconButton(icon: Icon(Icons.arrow_forward), onPressed: () {})
            ],
          ),
        ),
        Container(
          height: 280,
          child: ListView.builder(
            padding: EdgeInsets.only(left: 12.0),
            addAutomaticKeepAlives: false,
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            itemBuilder: (ctx, i) => MovieCard(),
          ),
        )
      ],
    );
  }
}
