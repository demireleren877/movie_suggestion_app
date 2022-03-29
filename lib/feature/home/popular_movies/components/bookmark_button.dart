import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookmarkButton extends StatelessWidget {
  const BookmarkButton({
    Key? key,
  }) : super(key: key);

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
        Icon(
          Icons.add,
          size: 24.sp,
        ),
      ],
    );
  }
}
