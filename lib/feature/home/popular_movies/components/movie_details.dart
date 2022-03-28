import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kartal/kartal.dart';

import '../../../../core/models/popular_movie_model.dart';
import 'vote_average.dart';

class MovieDetails extends StatelessWidget {
  const MovieDetails(
      {Key? key, required this.popularMovies, required this.index})
      : super(key: key);
  final List<Movie> popularMovies;
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
        VoteAverage(popularMovies: popularMovies, index: index),
        context.emptySizedWidthBoxNormal,
        Text(
          emoji(popularMovies[index].originalLanguage),
          style: TextStyle(fontSize: 16.sp),
        )
      ],
    );
  }
}
