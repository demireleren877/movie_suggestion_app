import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kartal/kartal.dart';

class LittleMovieDetailWidget extends StatelessWidget {
  const LittleMovieDetailWidget(
      {Key? key, required this.title, required this.text})
      : super(key: key);
  final String title;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(title, style: TextStyle(fontSize: 16.sp, color: Colors.amber)),
        context.emptySizedHeightBoxLow,
        Text(
          text,
          style: TextStyle(fontSize: 16.sp),
        ),
      ],
    );
  }
}
