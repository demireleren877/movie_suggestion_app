import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swipable/flutter_swipable.dart';

import '../../../core/constants/app_constants.dart';

class ImageCard extends StatelessWidget {
  const ImageCard({Key? key, required this.i, required this.imageUrl})
      : super(key: key);
  final int i;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Swipable(
      verticalSwipe: false,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15.r),
        child: Image.network(
          AppConstants.imageurl + imageUrl,
        ),
      ),
    );
  }
}
