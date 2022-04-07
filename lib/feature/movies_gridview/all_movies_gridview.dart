import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kartal/kartal.dart';
import 'package:movie_application/core/colors/app_colors.dart';
import 'package:movie_application/core/components/centered_progress.dart';
import 'package:movie_application/feature/movies_gridview/cubit/all_movies_cubit.dart';

import '../../core/components/movie_card.dart';
import '../../core/models/movie_model.dart';
import 'components/search_button.dart';
import 'components/search_field.dart';
import 'components/shimmer_widget.dart';

class MoviesGridview extends StatelessWidget {
  const MoviesGridview({
    Key? key,
    required this.movies,
    required this.title,
    required this.onBackPressed,
    required this.scrollController,
  }) : super(key: key);
  final List<Movie> movies;
  final String title;
  final VoidCallback onBackPressed;
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllMoviesCubit, AllMoviesState>(
      builder: (context, state) {
        if (state is AllMoviesChangeButton) {
          return Scaffold(
            appBar: _buildAppBar(context),
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
                      if (index == movies.length ||
                          index == movies.length + 1) {
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
        } else if (state is AllMoviesLoaded) {
          return Scaffold(
            appBar: _buildAppBar(context),
            body: Column(
              children: [
                context.emptySizedHeightBoxLow3x,
                Flexible(
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    controller: scrollController,
                    itemCount: state.movies.length,
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: context.width * 0.5,
                      crossAxisSpacing: 15.w,
                      childAspectRatio: 0.59,
                      mainAxisSpacing: 15.h,
                    ),
                    itemBuilder: (context, index) {
                      return MovieCard(
                        movies: state.movies,
                        index: index,
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        } else {
          return const CenteredProgressIndicator();
        }
      },
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.transparent,
      leading: BackButton(
        onPressed: onBackPressed,
      ),
      iconTheme: IconThemeData(size: 30.sp),
      toolbarHeight: 70.h,
      centerTitle: true,
      title: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        transitionBuilder: (Widget child, Animation<double> animation) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
        child: context.watch<AllMoviesCubit>().isSearching
            ? const SearchField()
            : Text(title,
                style: context.textTheme.headline5?.copyWith(fontSize: 28.sp)),
      ),
      actions: const [
        SearchButton(),
      ],
    );
  }
}
