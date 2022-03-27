import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../cubit/home_cubit.dart';
import 'components/movie_card.dart';

class PopularMovieList extends StatelessWidget {
  const PopularMovieList({
    Key? key,
    required this.state,
  }) : super(key: key);
  final HomeLoaded state;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.dynamicHeight(0.38),
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: state.popularMovies.length,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return MovieCard(index: index, state: state);
        },
      ),
    );
  }
}
