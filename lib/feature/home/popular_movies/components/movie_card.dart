import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../../../core/models/popular_movie_model.dart';
import 'movie_details.dart';
import 'movie_image.dart';
import 'movie_name.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({
    Key? key,
    required this.popularMovies,
    required this.index,
  }) : super(key: key);
  final List<Movie> popularMovies;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: context.horizontalPaddingLow,
      child: Column(
        children: [
          MovieImage(index: index, popularMovies: popularMovies),
          context.emptySizedHeightBoxLow,
          MovieName(index: index, popularMovies: popularMovies),
          context.emptySizedHeightBoxLow,
          MovieDetails(index: index, popularMovies: popularMovies),
          context.emptySizedHeightBoxLow
        ],
      ),
    );
  }
}