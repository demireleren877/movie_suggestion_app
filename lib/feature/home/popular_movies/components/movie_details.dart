import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kartal/kartal.dart';
import 'package:movie_application/feature/home/cubit/home_cubit.dart';

import 'vote_average.dart';

class MovieDetails extends StatelessWidget {
  const MovieDetails({Key? key, required this.state, required this.index})
      : super(key: key);
  final HomeLoaded state;
  final int index;

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

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        VoteAverage(state: state, index: index),
        context.emptySizedWidthBoxNormal,
        Text(
          emoji(state.popularMovies[index].originalLanguage),
          style: TextStyle(fontSize: 16.sp),
        )
      ],
    );
  }
}
