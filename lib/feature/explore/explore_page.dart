import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kartal/kartal.dart';
import 'package:movie_application/core/components/centered_progress.dart';
import 'package:movie_application/core/components/home_title.dart';
import 'package:movie_application/feature/explore/cubit/explore_cubit.dart';
import 'package:movie_application/core/components/all_movies_gridview.dart';

import '../../core/models/movie_model.dart';
import '../home/popular_movies/components/movie_card.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExploreCubit, ExploreState>(
      builder: (context, state) {
        if (state is ExploreInitial) {
          return const CenteredProgressIndicator();
        } else if (state is ExploreLoading) {
          return const CenteredProgressIndicator();
        } else if (state is ExploreLoaded) {
          return Scaffold(
            body: Container(
              padding: context.paddingLow,
              height: context.height,
              width: context.width,
              child: ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  context.emptySizedHeightBoxLow,
                  HomeTitle(
                    title: "Upcoming Movies",
                    onPress: () {
                      context.read<ExploreCubit>().seeAllUpcomingMovies();
                    },
                  ),
                  context.emptySizedHeightBoxLow,
                  UpcomingMoviesList(upcomingMovies: state.upcomingMovies),
                  context.emptySizedHeightBoxLow3x,
                  GenreList(state: state),
                  context.emptySizedHeightBoxLow3x,
                  TopratedMovieList(topRatedMovies: state.topRatedMovies),
                ],
              ),
            ),
          );
        } else if (state is SeeAllUpcomingMovies) {
          return MoviesGridview(
            title: "All Upcoming Movies",
            scrollController: state.scrollController,
            movies: state.movies,
            onBackPressed: () {
              context.read<ExploreCubit>().loadExplore();
            },
          );
        } else if (state is DiscoverNewMovies) {
          return MoviesGridview(
            title: "Discover New Movies",
            scrollController: state.scrollController,
            movies: state.movies,
            onBackPressed: () {
              context.read<ExploreCubit>().loadExplore();
            },
          );
        } else {
          return const Center(
            child: Text('Something went wrong'),
          );
        }
      },
    );
  }
}

class TopratedMovieList extends StatelessWidget {
  const TopratedMovieList({
    Key? key,
    required this.topRatedMovies,
  }) : super(key: key);
  final List<Movie> topRatedMovies;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.dynamicHeight(0.38),
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: topRatedMovies.length,
        itemBuilder: (BuildContext context, int index) {
          return MovieCard(
            index: index,
            movies: topRatedMovies,
          );
        },
      ),
    );
  }
}

class GenreList extends StatelessWidget {
  const GenreList({
    Key? key,
    required this.state,
  }) : super(key: key);
  final ExploreLoaded state;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: context.horizontalPaddingLow,
      height: context.dynamicHeight(0.05),
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: state.genres.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              index != 0
                  ? context
                      .read<ExploreCubit>()
                      .changeGenre(state.genres[index].id, state)
                  : context.read<ExploreCubit>().discoverMovies();
            },
            child: Container(
              padding: context.paddingLow,
              margin: context.horizontalPaddingLow,
              decoration: BoxDecoration(
                borderRadius: context.normalBorderRadius,
                border: Border.all(
                  color: index != 0 ? Colors.white : Colors.blue,
                ),
                color: state.genres[index].id ==
                        context.read<ExploreCubit>().selectedGenre
                    ? Colors.white70
                    : const Color(0xFF252a31),
              ),
              height: context.dynamicHeight(0.05),
              child: Center(
                child: Text(
                  state.genres[index].name,
                  style: context.textTheme.bodyText1?.copyWith(
                    fontSize: 16.sp,
                    color: state.genres[index].id ==
                            context.read<ExploreCubit>().selectedGenre
                        ? const Color(0xFF252a31)
                        : Colors.white70,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class UpcomingMoviesList extends StatelessWidget {
  const UpcomingMoviesList({
    Key? key,
    required this.upcomingMovies,
  }) : super(key: key);

  final List<Movie> upcomingMovies;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.dynamicHeight(0.38),
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: upcomingMovies.length,
        itemBuilder: (BuildContext context, int index) {
          return MovieCard(
            index: index,
            movies: upcomingMovies,
          );
        },
      ),
    );
  }
}
