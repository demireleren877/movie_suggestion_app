import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';

import '../../../core/models/movie_detail_model.dart';

class OverviewText extends StatelessWidget {
  const OverviewText({
    Key? key,
    required this.detail,
  }) : super(key: key);
  final MovieDetail detail;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.paddingNormal,
      child: Text(
        detail.overview,
        style: context.textTheme.bodyText1?.copyWith(
            fontSize: 20.sp, fontFamily: GoogleFonts.quicksand().fontFamily),
      ),
    );
  }
}
