import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';

import '../../../core/constants/api_constants.dart';
import '../../../core/models/movie_detail_model.dart';

class DetailsHeader extends StatelessWidget {
  const DetailsHeader({
    Key? key,
    required this.detail,
  }) : super(key: key);

  final MovieDetail detail;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: context.lowBorderRadius,
          child: Image.network(
            ApiConstants.imageurl + detail.posterPath,
            height: context.height * 0.5,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          height: context.height * 0.5,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [
                const Color(0xFF252a31).withOpacity(1),
                const Color(0xFF252a31).withOpacity(0.0),
                const Color(0xFF252a31).withOpacity(0.3),
                const Color(0xFF252a31).withOpacity(0.15),
              ],
            ),
          ),
        ),
        Positioned(
          left: 10.w,
          bottom: 20.h,
          child: SizedBox(
            width: context.width * 0.7,
            child: Text(
              detail.title + "  " + '(${detail.releaseDate.split('-')[0]})',
              style: context.textTheme.headline4?.copyWith(
                color: Colors.white,
                fontFamily: GoogleFonts.josefinSans().fontFamily,
              ),
            ),
          ),
        ),
        BackButton(
          color: Colors.white,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
