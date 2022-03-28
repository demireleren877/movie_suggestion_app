import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';

class HomeTitle extends StatelessWidget {
  const HomeTitle({
    Key? key,
    required this.title,
    required this.onPress,
  }) : super(key: key);
  final String title;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: context.textTheme.headline3?.copyWith(
            fontFamily: GoogleFonts.josefinSans().fontFamily,
          ),
        ),
        TextButton(
          onPressed: () => onPress(),
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
