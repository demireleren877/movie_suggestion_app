import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:movie_application/core/colors/app_colors.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerWidget extends StatelessWidget {
  const ShimmerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      child: Padding(
        padding: context.paddingLow,
        child: ClipRRect(
          borderRadius: context.lowBorderRadius,
          child: Container(
            color: AppColors.shimmerColors[0],
          ),
        ),
      ),
      baseColor: AppColors.shimmerColors[1],
      highlightColor: AppColors.shimmerColors[2],
    );
  }
}
