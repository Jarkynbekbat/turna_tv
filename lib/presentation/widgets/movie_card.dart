import 'dart:math';

import 'package:flutter/material.dart';

import 'package:turna_tv/data/models/movie.dart';
import 'package:turna_tv/presentation/screens/movie_detail_screen/movie_detail_screen.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;
  const MovieCard({this.movie});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => MovieDetailScreen(
                movie: movie,
              ),
            ),
          );
          // Navigator.of(context).pushNamed(
          //   MovieDetailsScreen.routeName,
          //   arguments: {
          //     'id': movieList[index].id,
          //     'title': movieList[index].title,
          //     'imageUrl': movieList[index].imageUrl,
          //     'description': movieList[index].description,
          //     'rating': movieList[index].rating,
          //     'year': movieList[index].year,
          //     'duration': movieList[index].duration,
          //   },
          // );
        },
        child: Column(
          children: <Widget>[
            Card(
              elevation: 10,
              child: Hero(
                tag: Random.secure(),
                child: Container(
                  height: 180,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          "https://m.media-amazon.com/images/M/MV5BMTc5MDE2ODcwNV5BMl5BanBnXkFtZTgwMzI2NzQ2NzM@._V1_SX300.jpg"),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Avengers: Endgame",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
