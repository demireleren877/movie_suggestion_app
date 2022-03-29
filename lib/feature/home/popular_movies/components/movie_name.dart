import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';

import '../../../../core/models/movie_model.dart';

class MovieName extends StatelessWidget {
  const MovieName({
    Key? key,
    required this.popularMovies,
    required this.index,
  }) : super(key: key);
  final List<Movie> popularMovies;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 150.w,
      child: Text(
        popularMovies[index].title,
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
