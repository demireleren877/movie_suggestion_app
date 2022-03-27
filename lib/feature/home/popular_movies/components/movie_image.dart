import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../../../core/constants/api_constants.dart';
import '../../cubit/home_cubit.dart';

class MovieImage extends StatelessWidget {
  const MovieImage({
    Key? key,
    required this.state,
    required this.index,
  }) : super(key: key);
  final HomeLoaded state;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ClipRRect(
        borderRadius: context.lowBorderRadius,
        child: Image.network(
          ApiConstants.imageurl + state.popularMovies[index].posterPath,
        ),
      ),
    );
  }
}
