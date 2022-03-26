import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../cubit/home_cubit.dart';
import 'movie_details.dart';
import 'movie_image.dart';
import 'movie_name.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({
    Key? key,
    required this.state,
    required this.index,
  }) : super(key: key);
  final HomeLoaded state;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: context.horizontalPaddingLow,
      decoration: BoxDecoration(
        color: Colors.blueGrey.shade800,
        borderRadius: context.lowBorderRadius,
      ),
      child: Column(
        children: [
          MovieImage(index: index, state: state),
          context.emptySizedHeightBoxLow,
          MovieName(index: index, state: state),
          context.emptySizedHeightBoxLow,
          MovieDetails(state: state, index: index),
          context.emptySizedHeightBoxLow,
        ],
      ),
    );
  }
}
