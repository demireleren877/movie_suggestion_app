import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kartal/kartal.dart';

import '../../../core/models/movie_detail_model.dart';

class MovieGenres extends StatelessWidget {
  const MovieGenres({
    Key? key,
    required this.detail,
  }) : super(key: key);
  final MovieDetail detail;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: detail.genres.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white),
              borderRadius: context.lowBorderRadius,
            ),
            margin: context.horizontalPaddingLow,
            padding: context.horizontalPaddingLow,
            child: Center(
              child: Text(
                detail.genres[index]['name'],
                style: TextStyle(fontSize: 16.sp),
              ),
            ),
          );
        },
      ),
    );
  }
}
