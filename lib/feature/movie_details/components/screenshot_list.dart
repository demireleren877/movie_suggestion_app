import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../../core/constants/api_constants.dart';
import '../../../core/models/movie_detail_model.dart';

class ScreenshotList extends StatelessWidget {
  const ScreenshotList({
    Key? key,
    required this.detail,
  }) : super(key: key);
  final MovieDetail detail;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.height * 0.2,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: detail.movieImage?.backdrops.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            width: context.width * 0.8,
            margin: context.horizontalPaddingLow,
            child: ClipRRect(
              borderRadius: context.lowBorderRadius,
              child: Image.network(
                ApiConstants.imageurl +
                    (detail.movieImage?.backdrops[index].imagePath ?? ""),
                height: context.height * 0.2,
                width: context.width * 0.3,
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}
