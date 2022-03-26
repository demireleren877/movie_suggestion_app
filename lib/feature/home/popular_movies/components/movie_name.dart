import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';

import '../../cubit/home_cubit.dart';

class MovieName extends StatelessWidget {
  const MovieName({
    Key? key,
    required this.state,
    required this.index,
  }) : super(key: key);
  final HomeLoaded state;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 150.w,
      child: Text(
        state.popularMovies[index].title,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: context.textTheme.bodyLarge?.copyWith(
          fontSize: 18.sp,
          fontWeight: FontWeight.bold,
          fontFamily: GoogleFonts.josefinSans().fontFamily,
        ),
      ),
    );
  }
}
