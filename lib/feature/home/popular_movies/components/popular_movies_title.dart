import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';

import '../../cubit/home_cubit.dart';

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
          onPressed: () {
            context.read<HomeCubit>().seeAllPopularMovies();
          },
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
