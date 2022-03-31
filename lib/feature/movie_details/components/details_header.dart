import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';
import 'package:url_launcher/url_launcher.dart';

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
        HeaderImage(detail: detail),
        const HeaderShadow(),
        HeaderTitle(detail: detail),
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

class HeaderTitle extends StatelessWidget {
  const HeaderTitle({
    Key? key,
    required this.detail,
  }) : super(key: key);

  final MovieDetail detail;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 10.w,
      bottom: 20.h,
      child: Row(
        children: [
          SizedBox(
            width: context.width * 0.7,
            child: Text(
              detail.title + "  " + '(${detail.releaseDate.split('-')[0]})',
              style: context.textTheme.headline4?.copyWith(
                fontSize: 28.sp,
                color: Colors.white,
                fontFamily: GoogleFonts.josefinSans().fontFamily,
              ),
            ),
          ),
          context.emptySizedWidthBoxNormal,
          GestureDetector(
            onTap: () async {
              await launch("https://www.youtube.com/watch?v=${detail.videoId}");
            },
            child: Icon(
              Icons.play_circle_outline,
              color: Colors.white,
              size: 40.sp,
            ),
          )
        ],
      ),
    );
  }
}

class HeaderShadow extends StatelessWidget {
  const HeaderShadow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}

class HeaderImage extends StatelessWidget {
  const HeaderImage({
    Key? key,
    required this.detail,
  }) : super(key: key);

  final MovieDetail detail;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      ApiConstants.imageurl + detail.posterPath,
      height: context.height * 0.5,
      width: double.infinity,
      fit: BoxFit.fitWidth,
    );
  }
}
