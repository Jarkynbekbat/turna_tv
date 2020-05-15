import 'package:flutter/material.dart';

import 'package:turna_tv/data/models/item_models/movie.dart';
import 'package:turna_tv/ui/widgets/movie_card.dart';

class MovieGridScreen extends StatelessWidget {
  final String title;
  final List<Movie> movies;
  const MovieGridScreen({
    @required this.title,
    @required this.movies,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.count(
          crossAxisCount: 3,
          childAspectRatio: 3 / 4.5,
          children: List.generate(
            movies.length,
            (i) => Container(
              child: Column(
                children: <Widget>[
                  Container(
                    height: 188,
                    child: MovieCard(movie: movies[i]),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
