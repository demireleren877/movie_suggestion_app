import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kartal/kartal.dart';

class DetailsPageTitle extends StatelessWidget {
  const DetailsPageTitle({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.horizontalPaddingNormal,
      child: Text(title,
          style: context.textTheme.headline5?.copyWith(
            fontSize: 24.sp,
          )),
    );
  }
}
