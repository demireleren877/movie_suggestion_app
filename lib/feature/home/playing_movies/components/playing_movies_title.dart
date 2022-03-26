import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';
import 'package:movie_application/feature/home/constants.dart';

class PlayingMoviesTitle extends StatelessWidget {
  const PlayingMoviesTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      HomeConstants.playingMoviesTitle,
      style: context.textTheme.headline3?.copyWith(
        fontFamily: GoogleFonts.josefinSans().fontFamily,
      ),
    );
  }
}
