import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../../core/models/movie_model.dart';
import '../../../core/components/movie_card.dart';

class DiscoverMovieList extends StatelessWidget {
  const DiscoverMovieList({
    Key? key,
    required this.movies,
  }) : super(key: key);
  final List<Movie> movies;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.dynamicHeight(0.38),
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: movies.length,
        itemBuilder: (BuildContext context, int index) {
          return MovieCard(
            index: index,
            movies: movies,
          );
        },
      ),
    );
  }
}
