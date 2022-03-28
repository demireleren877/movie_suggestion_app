import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
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
            color: Colors.grey,
          ),
        ),
      ),
      baseColor: Colors.black38,
      highlightColor: Colors.black54,
    );
  }
}
