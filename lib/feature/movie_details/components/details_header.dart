import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:kartal/kartal.dart';
import 'package:movie_application/core/cache/cache_manager.dart';
import 'package:movie_application/core/components/reminder_button.dart';
import 'package:movie_application/feature/home/popular_movies/components/bookmark_button.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/constants/api_constants.dart';
import '../../../core/constants/hive_constants.dart';
import '../../../core/models/movie_detail_model.dart';
import '../../../core/models/movie_model.dart';

class DetailsHeader extends StatelessWidget {
  DetailsHeader({
    Key? key,
    required this.detail,
  }) : super(key: key);

  final MovieDetail detail;
  final CacheManager _cacheManager = CacheManager();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        HeaderImage(detail: detail),
        const HeaderShadow(),
        HeaderTitle(detail: detail),
        IconButton(
          color: Colors.white,
          icon: Icon(
            Icons.arrow_back,
            size: 30.sp,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        Positioned(
          right: 0,
          child: BookmarkButton(
            movieId: int.parse(detail.id),
            onTap: () {
              Hive.box(HiveConstants.hiveMovieList)
                      .keys
                      .contains(int.parse(detail.id))
                  ? _cacheManager.deleteMovieHive(int.parse(detail.id),
                      Hive.box(HiveConstants.hiveMovieList))
                  : _cacheManager.saveMovieHive(
                      Movie(
                        runtime: 0,
                        backdropPath: "",
                        id: int.parse(detail.id),
                        originalLanguage: "",
                        originalTitle: detail.originalTitle,
                        overview: detail.overview,
                        posterPath: detail.posterPath,
                        releaseDate: detail.releaseDate,
                        title: detail.title,
                        video: false,
                        voteCount: 0,
                        voteAverage: "",
                      ),
                      Hive.box(HiveConstants.hiveMovieList));
            },
          ),
        ),
      ],
    );
  }
}

class HeaderTitle extends StatelessWidget {
  HeaderTitle({
    Key? key,
    required this.detail,
  }) : super(key: key);

  final MovieDetail detail;
  final CacheManager _cacheManager = CacheManager();

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 10.w,
      bottom: 20.h,
      child: Row(
        children: [
          SizedBox(
            width: context.width * 0.7,
            child: Text(
              detail.title + "  " + '(${detail.releaseDate.split('-')[0]})',
              style: context.textTheme.headline4?.copyWith(
                fontSize: 28.sp,
                color: Colors.white,
                fontFamily: GoogleFonts.josefinSans().fontFamily,
              ),
            ),
          ),
          context.emptySizedWidthBoxNormal,
          GestureDetector(
            onTap: () async {
              await launch("https://www.youtube.com/watch?v=${detail.videoId}");
            },
            child: Icon(
              Icons.play_circle_outline,
              color: Colors.white,
              size: 40.sp,
            ),
          ),
          context.emptySizedWidthBoxLow,
          ReminderButton(
            movieId: int.parse(detail.id),
            onTap: () {
              Hive.box(HiveConstants.reminderList)
                      .keys
                      .contains(int.parse(detail.id))
                  ? _cacheManager.deleteMovieHive(int.parse(detail.id),
                      Hive.box(HiveConstants.reminderList))
                  : _cacheManager.saveMovieHive(
                      Movie(
                        runtime: 0,
                        backdropPath: "",
                        id: int.parse(detail.id),
                        originalLanguage: "",
                        originalTitle: detail.originalTitle,
                        overview: detail.overview,
                        posterPath: detail.posterPath,
                        releaseDate: detail.releaseDate,
                        title: detail.title,
                        video: false,
                        voteCount: 0,
                        voteAverage: "",
                      ),
                      Hive.box(HiveConstants.reminderList));
            },
          )
        ],
      ),
    );
  }
}

class HeaderShadow extends StatelessWidget {
  const HeaderShadow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.height * 0.5,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [
            const Color(0xFF252a31).withOpacity(1),
            const Color(0xFF252a31).withOpacity(0.0),
            const Color(0xFF252a31).withOpacity(0.3),
            const Color(0xFF252a31).withOpacity(0.15),
          ],
        ),
      ),
    );
  }
}

class HeaderImage extends StatelessWidget {
  const HeaderImage({
    Key? key,
    required this.detail,
  }) : super(key: key);

  final MovieDetail detail;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      ApiConstants.imageurl + detail.posterPath,
      height: context.height * 0.5,
      width: double.infinity,
      fit: BoxFit.fitWidth,
    );
  }
}
