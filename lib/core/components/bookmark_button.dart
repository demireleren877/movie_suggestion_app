import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:movie_application/core/colors/app_colors.dart';

import '../constants/hive_constants.dart';

class BookmarkButton extends StatelessWidget {
  const BookmarkButton({
    Key? key,
    required this.movieId,
    required this.onTap,
  }) : super(key: key);
  final int movieId;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: AppColors.transparent,
      onTap: onTap,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Icon(
            Icons.bookmark_sharp,
            size: 55.sp,
            color: AppColors.black075,
          ),
          ValueListenableBuilder(
            valueListenable: Hive.box(HiveConstants.hiveMovieList).listenable(),
            builder: (context, Box box, _) => Icon(
              box.keys.contains(movieId) ? Icons.done : Icons.add,
              size: 24.sp,
            ),
          ),
        ],
      ),
    );
  }
}
