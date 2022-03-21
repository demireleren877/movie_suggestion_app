import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swipable/flutter_swipable.dart';
import 'package:kartal/kartal.dart';

import '../../../core/constants/app_constants.dart';

class ImageCard extends StatelessWidget {
  const ImageCard({Key? key, required this.i}) : super(key: key);
  final int i;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.height * 0.8,
      padding: context.paddingLow,
      child: Swipable(
        onSwipeLeft: (context) => print('left'),
        verticalSwipe: false,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15.r),
          child: Image.network(
            AppConstants.imageurl,
          ),
        ),
      ),
    );
  }
}
