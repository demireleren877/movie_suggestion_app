import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';
import 'package:movie_application/feature/home/popular_movies/popular_movies_screen.dart';

import '../../core/components/centered_progress.dart';
import 'cubit/home_cubit.dart';
import 'playing_movies/components/playing_movies_title.dart';
import 'playing_movies/playing_movies_slider.dart';
import 'popular_movies/components/popular_movies_title.dart';
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
                      const PlayingMoviesTitle(),
                      context.emptySizedHeightBoxLow3x,
                      PlayingMoviesSlider(state: state),
                      context.emptySizedHeightBoxNormal,
                      const PopularMoviesTitle(),
                      context.emptySizedHeightBoxLow3x,
                      PopularMovieList(popularMovies: state.popularMovies),
                    ],
                  ),
                )
              ],
            ),
          );
        } else if (state is SeeAllPopularMovies) {
          return PopularMoviesScreen(state: state);
        } else {
          return const Center(child: Text("Some error occured."));
        }
      },
    );
  }
}
