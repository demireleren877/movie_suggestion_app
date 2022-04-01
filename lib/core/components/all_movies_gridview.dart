import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kartal/kartal.dart';
import 'package:movie_application/core/models/movie_model.dart';

import 'movie_card.dart';
import '../../feature/home/popular_movies/components/shimmer_widget.dart';

class MoviesGridview extends StatelessWidget {
  const MoviesGridview({
    Key? key,
    required this.title,
    required this.scrollController,
    required this.movies,
    required this.onBackPressed,
  }) : super(key: key);
  final String title;
  final ScrollController scrollController;
  final List<Movie> movies;
  final VoidCallback onBackPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: onBackPressed,
        ),
        centerTitle: true,
        title: Text(title),
      ),
      body: Column(
        children: [
          context.emptySizedHeightBoxLow3x,
          Flexible(
            child: GridView.builder(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              controller: scrollController,
              itemCount: movies.length + 2,
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: context.width * 0.5,
                crossAxisSpacing: 15.w,
                childAspectRatio: 0.59,
                mainAxisSpacing: 15.h,
              ),
              itemBuilder: (context, index) {
                if (index == movies.length || index == movies.length + 1) {
                  return const ShimmerWidget();
                }
                return MovieCard(
                  movies: movies,
                  index: index,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
