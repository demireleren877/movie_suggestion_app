import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kartal/kartal.dart';
import 'package:movie_application/core/components/centered_progress.dart';
import 'package:movie_application/feature/movies_gridview/cubit/all_movies_cubit.dart';

import '../../core/components/movie_card.dart';
import '../../core/models/movie_model.dart';
import '../home/popular_movies/components/shimmer_widget.dart';

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
                    itemCount: state.movies.length + 2,
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
      backgroundColor: Colors.transparent,
      leading: BackButton(
        onPressed: onBackPressed,
      ),
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
            : Text(title),
      ),
      actions: const [
        SearchButton(),
      ],
    );
  }
}

class SearchField extends StatelessWidget {
  const SearchField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45.h,
      child: TextField(
        onChanged: ((value) => value != ""
            ? context.read<AllMoviesCubit>().onSearchChanged(value)
            : null),
        decoration: InputDecoration(
          floatingLabelAlignment: FloatingLabelAlignment.center,
          contentPadding: context.horizontalPaddingNormal,
          hintText: 'Search any movie...',
          border: InputBorder.none,
        ),
      ),
    );
  }
}

class SearchButton extends StatelessWidget {
  const SearchButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      splashRadius: 5,
      icon: context.watch<AllMoviesCubit>().isSearching
          ? const Icon(Icons.clear)
          : const Icon(Icons.search),
      onPressed: () {
        context.read<AllMoviesCubit>().onSearchPressed();
      },
    );
  }
}
