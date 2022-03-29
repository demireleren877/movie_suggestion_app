import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kartal/kartal.dart';
import 'package:movie_application/feature/home/popular_movies/components/bookmark_button.dart';

import '../../../../core/constants/api_constants.dart';
import '../../../../core/models/movie_model.dart';

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
        child: Stack(
          children: [
            Image.network(
              ApiConstants.imageurl + popularMovies[index].posterPath,
            ),
            Positioned(
              top: -9.h,
              right: -12.w,
              child: GestureDetector(
                onTap: () {},
                child: const BookmarkButton(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
