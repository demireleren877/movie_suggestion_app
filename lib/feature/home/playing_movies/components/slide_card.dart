import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kartal/kartal.dart';
import 'package:movie_application/feature/movie_details/detail_screen.dart';
import 'movie_image.dart';
import 'movie_title.dart';
import 'movie_vote.dart';
import 'slider_shadow.dart';

class SlideCard extends StatelessWidget {
  const SlideCard({
    Key? key,
    required this.image,
    required this.title,
    required this.voteAverage,
    required this.movieId,
  }) : super(key: key);

  final String image;
  final int movieId;
  final String title;
  final String voteAverage;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.navigateToPage(
          DetailScreen(
            movieId: movieId,
          ),
        );
      },
      child: Stack(
        fit: StackFit.expand,
        children: [
          MovieImage(image: image),
          const SliderShadow(),
          Positioned(
            child: SizedBox(
              width: context.width * 0.9,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MovieTitle(title: title),
                  VoteRow(voteAverage: voteAverage),
                ],
              ),
            ),
            bottom: 5.h,
            left: 15.w,
          )
        ],
      ),
    );
  }
}
