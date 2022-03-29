import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kartal/kartal.dart';

class MovieTitle extends StatelessWidget {
  const MovieTitle({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Text(
        title,
        style: context.textTheme.headline6?.copyWith(fontSize: 22.sp),
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
      ),
    );
  }
}
