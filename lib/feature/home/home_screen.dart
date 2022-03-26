import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';
import 'package:movie_application/core/constants/api_constants.dart';

import '../../core/components/centered_progress.dart';
import 'cubit/home_cubit.dart';
import 'playing_movies/components/playing_movies_title.dart';
import 'playing_movies/playing_movies_slider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is HomeInitial) {
          return const CenteredProgressIndicator();
        } else if (state is HomeLoading) {
          return const CenteredProgressIndicator();
        } else if (state is HomeLoaded) {
          return Scaffold(
            body: ListView(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              children: [
                Container(
                  height: context.height,
                  padding: context.paddingLow,
                  width: context.width,
                  alignment: Alignment.center,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      context.emptySizedHeightBoxLow3x,
                      const PlayingMoviesTitle(),
                      context.emptySizedHeightBoxLow3x,
                      PlayingMoviesSlider(state: state),
                      context.emptySizedHeightBoxNormal,
                      const PopularMoviesTitle(),
                      context.emptySizedHeightBoxLow3x,
                      SizedBox(
                        height: context.dynamicHeight(0.4),
                        child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          itemCount: state.popularMovies.length,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              margin: context.horizontalPaddingLow,
                              decoration: BoxDecoration(
                                color: Colors.blueGrey.shade800,
                                borderRadius: context.lowBorderRadius,
                              ),
                              child: Column(
                                children: [
                                  Flexible(
                                    child: ClipRRect(
                                      borderRadius: context.lowBorderRadius,
                                      child: Image.network(
                                        ApiConstants.imageurl +
                                            state.popularMovies[index]
                                                .posterPath,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  context.emptySizedHeightBoxLow,
                                  Container(
                                    alignment: Alignment.center,
                                    width: 150.w,
                                    child: Text(
                                      state.popularMovies[index].title,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style:
                                          context.textTheme.bodyLarge?.copyWith(
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: GoogleFonts.josefinSans()
                                            .fontFamily,
                                      ),
                                    ),
                                  ),
                                  context.emptySizedHeightBoxLow,
                                  Row(
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            state.popularMovies[index]
                                                .voteAverage
                                                .toString(),
                                            style: context.textTheme.bodyLarge
                                                ?.copyWith(
                                              fontSize: 18.sp,
                                              fontWeight: FontWeight.bold,
                                              fontFamily:
                                                  GoogleFonts.josefinSans()
                                                      .fontFamily,
                                            ),
                                          ),
                                          Icon(
                                            Icons.star,
                                            size: 18.w,
                                            color: Colors.yellow,
                                          ),
                                        ],
                                      ),
                                      context.emptySizedWidthBoxNormal,
                                      Text(emoji(state.popularMovies[index]
                                          .originalLanguage))
                                    ],
                                  ),
                                  context.emptySizedHeightBoxLow,
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        } else {
          return const Center(child: Text("Some error occured."));
        }
      },
    );
  }

  emoji(String code) {
    int flagOffset = 0x1F1E6;
    int asciiOffset = 0x41;

    String country = code == "en"
        ? "US"
        : code == "ja"
            ? "JPN"
            : code.toUpperCase();

    int firstChar = country.codeUnitAt(0) - asciiOffset + flagOffset;
    int secondChar = country.codeUnitAt(1) - asciiOffset + flagOffset;

    String emoji =
        String.fromCharCode(firstChar) + String.fromCharCode(secondChar);
    return emoji;
  }
}

class PopularMoviesTitle extends StatelessWidget {
  const PopularMoviesTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Popular Movies',
          style: context.textTheme.headline3?.copyWith(
            fontFamily: GoogleFonts.josefinSans().fontFamily,
          ),
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            'See All',
            style: context.textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.w800,
              fontSize: 18.sp,
              color: CupertinoColors.systemBlue,
              fontFamily: GoogleFonts.josefinSans().fontFamily,
            ),
          ),
        ),
      ],
    );
  }
}
