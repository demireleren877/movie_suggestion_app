import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';
import 'package:movie_application/core/components/centered_progress.dart';
import 'package:movie_application/core/components/home_title.dart';
import 'package:movie_application/feature/explore/cubit/explore_cubit.dart';
import 'package:movie_application/core/components/all_movies_gridview.dart';

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
                  SizedBox(
                    height: context.dynamicHeight(0.38),
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: state.upcomingMovies.length,
                      itemBuilder: (BuildContext context, int index) {
                        return MovieCard(
                          index: index,
                          movies: state.upcomingMovies,
                        );
                      },
                    ),
                  ),
                  context.emptySizedHeightBoxLow3x,
                  SizedBox(
                    height: context.dynamicHeight(0.05),
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: state.genres.length,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            context
                                .read<ExploreCubit>()
                                .changeGenre(state.genres[index].id, state);
                          },
                          child: Container(
                            padding: context.paddingLow,
                            margin: context.horizontalPaddingLow,
                            decoration: BoxDecoration(
                              borderRadius: context.normalBorderRadius,
                              border: Border.all(
                                color: Colors.white,
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
                                  color: state.genres[index].id ==
                                          context
                                              .read<ExploreCubit>()
                                              .selectedGenre
                                      ? const Color(0xFF252a31)
                                      : Colors.white70,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  context.emptySizedHeightBoxLow3x,
                  SizedBox(
                    height: context.dynamicHeight(0.38),
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: state.topRatedMovies.length,
                      itemBuilder: (BuildContext context, int index) {
                        return MovieCard(
                          index: index,
                          movies: state.topRatedMovies,
                        );
                      },
                    ),
                  ),
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
        } else {
          return const Center(
            child: Text('Something went wrong'),
          );
        }
      },
    );
  }
}
