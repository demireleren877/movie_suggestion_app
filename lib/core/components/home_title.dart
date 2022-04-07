import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';
import 'package:movie_application/core/colors/app_colors.dart';
import 'package:movie_application/core/localization/app_localizations.dart';

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
            fontSize: 30.sp,
          ),
        ),
        TextButton(
          onPressed: () => onPress(),
          child: Text(
            AppLocalizations.instance.translate("see_all") ?? "",
            style: context.textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.w800,
              fontSize: 18.sp,
              color: AppColors.iosBlue,
              fontFamily: GoogleFonts.josefinSans().fontFamily,
            ),
          ),
        ),
      ],
    );
  }
}
