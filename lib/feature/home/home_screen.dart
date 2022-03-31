import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';
import 'package:movie_application/core/components/home_title.dart';
import 'package:movie_application/core/components/all_movies_gridview.dart';
import 'package:movie_application/core/localization/app_localizations.dart';
import '../../core/components/all_movies_gridview.dart';
import '../../core/components/centered_progress.dart';
import 'cubit/home_cubit.dart';
import 'playing_movies/playing_movies_slider.dart';
import 'popular_movies/popular_movie_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is HomeInitial) {
          return const CenteredProgressIndicator();
        } else if (state is HomeLoading) {
          return const CenteredProgressIndicator();
        } else if (state is ChangeLanguage) {
          return const CenteredProgressIndicator();
        } else if (state is HomeLoaded) {
          return Scaffold(
            body: ListView(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              children: [
                Container(
                  height: context.height,
                  padding: context.paddingLow,
                  width: context.width,
                  alignment: Alignment.center,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      context.emptySizedHeightBoxLow3x,
                      HomeTitle(
                        title: AppLocalizations.of(context)
                                ?.translate("playing_movie_title") ??
                            "ssss",
                        onPress: () {
                          context.read<HomeCubit>().seeAllPlayingMovies();
                        },
                      ),
                      context.emptySizedHeightBoxLow3x,
                      PlayingMoviesSlider(state: state),
                      context.emptySizedHeightBoxNormal,
                      HomeTitle(
                        title: "Popular Movies",
                        onPress: () {
                          context.read<HomeCubit>().seeAllPopularMovies();
                        },
                      ),
                      context.emptySizedHeightBoxLow3x,
                      PopularMovieList(popularMovies: state.popularMovies),
                    ],
                  ),
                )
              ],
            ),
          );
        } else if (state is SeeAllPopularMovies) {
          return MoviesGridview(
            title: "All Popular Movies",
            scrollController: state.scrollController,
            movies: state.popularMovies,
            onBackPressed: () {
              context.read<HomeCubit>().getAllMovies();
            },
          );
        } else if (state is SeeAllPlayingMovies) {
          return MoviesGridview(
            movies: state.playingMovies,
            scrollController: state.scrollController,
            title: "All Playing Movies",
            onBackPressed: () {
              context.read<HomeCubit>().getAllMovies();
            },
          );
        } else {
          return const Center(child: Text("Some error occured."));
        }
      },
    );
  }
}
