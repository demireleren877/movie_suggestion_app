import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';
import 'package:movie_application/feature/home/cubit/home_cubit.dart';

class VoteAverage extends StatelessWidget {
  const VoteAverage({Key? key, required this.state, required this.index})
      : super(key: key);
  final HomeLoaded state;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          state.popularMovies[index].voteAverage.toString(),
          style: context.textTheme.bodyLarge?.copyWith(
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
            fontFamily: GoogleFonts.josefinSans().fontFamily,
          ),
        ),
        Icon(
          Icons.star,
          size: 18.w,
          color: Colors.yellow,
        ),
      ],
    );
  }
}
