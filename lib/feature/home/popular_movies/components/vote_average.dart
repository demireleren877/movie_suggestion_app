import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';

import '../../../../core/models/popular_movie_model.dart';

class VoteAverage extends StatelessWidget {
  const VoteAverage(
      {Key? key, required this.popularMovies, required this.index})
      : super(key: key);
  final List<Movie> popularMovies;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          popularMovies[index].voteAverage.toString(),
          style: context.textTheme.bodyLarge?.copyWith(
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
            fontFamily: GoogleFonts.josefinSans().fontFamily,
          ),
        ),
        Icon(
          Icons.star,
          size: 18.sp,
          color: Colors.yellow,
        ),
      ],
    );
  }
}
