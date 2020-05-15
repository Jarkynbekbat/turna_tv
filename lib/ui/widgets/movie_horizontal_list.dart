import 'package:flutter/material.dart';
import 'package:turna_tv/ui/screens/movie_grid_screen/movie_grid_screen.dart';

import '../../data/models/item_models/movie.dart';
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
              Text(title),
              IconButton(
                  icon: Icon(Icons.arrow_forward),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) =>
                            MovieGridScreen(title: title, movies: movies),
                      ),
                    );
                  })
            ],
          ),
        ),
        Container(
          height: 180.0,
          child: ListView.builder(
            padding: EdgeInsets.only(left: 12.0),
            addAutomaticKeepAlives: false,
            scrollDirection: Axis.horizontal,
            itemCount: movies.length,
            itemBuilder: (ctx, i) => MovieCard(movie: movies[i]),
          ),
        )
      ],
    );
  }
}
