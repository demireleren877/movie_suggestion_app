import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kartal/kartal.dart';
import 'package:movie_application/core/colors/app_colors.dart';
import 'package:movie_application/core/components/home_title.dart';
import 'package:movie_application/core/localization/app_localizations.dart';
import '../../core/components/centered_progress.dart';
import '../../core/components/movie_card.dart';
import '../../core/constants/api_constants.dart';
import '../../core/models/movie_model.dart';
import '../movie_details/detail_screen.dart';
import '../movies_gridview/all_movies_gridview.dart';
import 'cubit/home_cubit.dart';
part "playing_movies/components/movie_image.dart";
part "playing_movies/components/slide_card.dart";
part 'playing_movies/components/movie_title.dart';
part 'playing_movies/components/movie_vote.dart';
part 'playing_movies/components/slider_shadow.dart';
part 'playing_movies/playing_movies_slider.dart';
part 'popular_movies/popular_movie_list.dart';

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
                        title: AppLocalizations.of(context)!
                                .translate("playing_movie_title") ??
                            "",
                        onPress: () {
                          context.read<HomeCubit>().seeAllPlayingMovies();
                        },
                      ),
                      context.emptySizedHeightBoxLow3x,
                      _PlayingMoviesSlider(state: state),
                      context.emptySizedHeightBoxNormal,
                      HomeTitle(
                        title: AppLocalizations.of(context)!
                                .translate("popular_movie_title") ??
                            "",
                        onPress: () {
                          context.read<HomeCubit>().seeAllPopularMovies();
                        },
                      ),
                      context.emptySizedHeightBoxLow3x,
                      _PopularMovieList(popularMovies: state.popularMovies),
                    ],
                  ),
                )
              ],
            ),
          );
        } else if (state is SeeAllPopularMovies) {
          return MoviesGridview(
            isVisible: true,
            title: AppLocalizations.instance.translate("popular_movie_title") ??
                "",
            scrollController: state.scrollController,
            movies: state.popularMovies,
            onBackPressed: () {
              context.read<HomeCubit>().getAllMovies();
            },
          );
        } else if (state is SeeAllPlayingMovies) {
          return MoviesGridview(
            isVisible: true,
            movies: state.playingMovies,
            scrollController: state.scrollController,
            title: AppLocalizations.instance.translate("playing_movie_title") ??
                "",
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
