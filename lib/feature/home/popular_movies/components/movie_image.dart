import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:kartal/kartal.dart';
import 'package:movie_application/core/cache/cache_manager.dart';
import 'package:movie_application/core/constants/hive_constants.dart';
import 'package:movie_application/feature/home/popular_movies/components/bookmark_button.dart';

import '../../../../core/constants/api_constants.dart';
import '../../../../core/models/movie_model.dart';

class MovieImage extends StatelessWidget {
  MovieImage({
    Key? key,
    required this.popularMovies,
    required this.index,
  }) : super(key: key);
  final List<Movie> popularMovies;
  final int index;
  final CacheManager _cacheManager = CacheManager();

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ClipRRect(
        borderRadius: context.lowBorderRadius,
        child: Stack(
          children: [
            Image.network(
              popularMovies[index].posterPath != ""
                  ? ApiConstants.imageurl + popularMovies[index].posterPath
                  : "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ3Id7Z-Fc6SazelMw-y_cu7CpzEFuwLMVz-Q&usqp=CAU",
            ),
            Positioned(
              top: -9.h,
              right: -12.w,
              child: BookmarkButton(
                movieId: popularMovies[index].id,
                onTap: () {
                  Hive.box(HiveConstants.hiveMovieList)
                          .keys
                          .contains(popularMovies[index].id)
                      ? _cacheManager.deleteMovieHive(popularMovies[index].id,
                          Hive.box(HiveConstants.hiveMovieList))
                      : _cacheManager.saveMovieHive(popularMovies[index],
                          Hive.box(HiveConstants.hiveMovieList));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
