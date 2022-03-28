import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../../../core/constants/api_constants.dart';
import '../../../../core/models/popular_movie_model.dart';

class MovieImage extends StatelessWidget {
  const MovieImage({
    Key? key,
    required this.popularMovies,
    required this.index,
  }) : super(key: key);
  final List<Movie> popularMovies;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ClipRRect(
        borderRadius: context.lowBorderRadius,
        child: Image.network(
          ApiConstants.imageurl + popularMovies[index].posterPath,
        ),
      ),
    );
  }
}
