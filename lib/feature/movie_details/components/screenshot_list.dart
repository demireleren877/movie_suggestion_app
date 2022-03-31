import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:movie_application/core/components/image_view.dart';

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
      height:
          detail.movieImage!.backdrops.isNotEmpty ? context.height * 0.25 : 0,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: detail.movieImage?.backdrops.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () => context.navigateToPage(
              ImageViewer(
                image: ApiConstants.imageurl +
                    (detail.movieImage?.backdrops[index].imagePath ?? ""),
              ),
            ),
            child: Container(
              width: context.width * 0.9,
              margin: context.horizontalPaddingLow,
              child: ClipRRect(
                borderRadius: context.lowBorderRadius,
                child: Image.network(
                  ApiConstants.imageurl +
                      (detail.movieImage?.backdrops[index].imagePath ?? ""),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
