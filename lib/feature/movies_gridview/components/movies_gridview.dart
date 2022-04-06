import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kartal/kartal.dart';

import '../../../core/components/movie_card.dart';
import '../../../core/models/movie_model.dart';

class MoviesGridview extends StatelessWidget {
  const MoviesGridview({
    Key? key,
    required this.scrollController,
    required this.movies,
    required this.length,
  }) : super(key: key);
  final ScrollController scrollController;
  final List<Movie> movies;
  final int length;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        context.emptySizedHeightBoxLow3x,
        Flexible(
          child: GridView.builder(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            controller: scrollController,
            itemCount: length,
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: context.width * 0.5,
              crossAxisSpacing: 15.w,
              childAspectRatio: 0.59,
              mainAxisSpacing: 15.h,
            ),
            itemBuilder: (context, index) {
              return MovieCard(
                movies: movies,
                index: index,
              );
            },
          ),
        ),
      ],
    );
  }
}
