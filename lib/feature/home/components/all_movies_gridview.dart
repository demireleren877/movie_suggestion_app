import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kartal/kartal.dart';
import 'package:movie_application/core/models/movie_model.dart';

import '../cubit/home_cubit.dart';
import '../popular_movies/components/movie_card.dart';
import '../popular_movies/components/shimmer_widget.dart';

class MoviesGridview extends StatelessWidget {
  const MoviesGridview({
    Key? key,
    required this.title,
    required this.scrollController,
    required this.movies,
  }) : super(key: key);
  final String title;
  final ScrollController scrollController;
  final List<Movie> movies;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: context.read<HomeCubit>().getAllMovies,
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
                  popularMovies: movies,
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
