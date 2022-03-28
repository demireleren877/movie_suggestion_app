import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../../core/models/popular_movie_model.dart';
import 'components/movie_card.dart';

class PopularMovieList extends StatelessWidget {
  const PopularMovieList({
    Key? key,
    required this.popularMovies,
  }) : super(key: key);
  final List<Movie> popularMovies;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.dynamicHeight(0.38),
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: popularMovies.length,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return MovieCard(
            index: index,
            popularMovies: popularMovies,
          );
        },
      ),
    );
  }
}
