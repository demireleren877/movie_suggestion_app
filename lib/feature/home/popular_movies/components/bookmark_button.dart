import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../../core/constants/hive_constants.dart';

class BookmarkButton extends StatelessWidget {
  const BookmarkButton({
    Key? key,
    required this.movieId,
  }) : super(key: key);
  final int movieId;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Icon(
          Icons.bookmark_sharp,
          size: 55.sp,
          color: Colors.black.withOpacity(0.75),
        ),
        ValueListenableBuilder(
          valueListenable: Hive.box(HiveConstants.hiveMovieList).listenable(),
          builder: (context, Box box, _) => Icon(
            box.keys.contains(movieId) ? Icons.done : Icons.add,
            size: 24.sp,
          ),
        ),
      ],
    );
  }
}
