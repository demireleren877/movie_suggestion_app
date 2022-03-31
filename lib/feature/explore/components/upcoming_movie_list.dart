import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../../core/models/movie_model.dart';
import '../../home/popular_movies/components/movie_card.dart';

class UpcomingMoviesList extends StatelessWidget {
  const UpcomingMoviesList({
    Key? key,
    required this.upcomingMovies,
  }) : super(key: key);

  final List<Movie> upcomingMovies;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.dynamicHeight(0.38),
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: upcomingMovies.length,
        itemBuilder: (BuildContext context, int index) {
          return MovieCard(
            index: index,
            movies: upcomingMovies,
          );
        },
      ),
    );
  }
}
