import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kartal/kartal.dart';
import 'package:movie_application/core/colors/app_colors.dart';
import 'package:movie_application/core/components/centered_progress.dart';
import 'package:movie_application/core/components/home_title.dart';
import 'package:movie_application/core/localization/app_localizations.dart';
import 'package:movie_application/feature/explore/cubit/explore_cubit.dart';
import '../../core/components/movie_card.dart';
import '../../core/models/movie_model.dart';
import '../movies_gridview/all_movies_gridview.dart';
part './components/genre_list.dart';
part './components/upcoming_movie_list.dart';
part './components/discover_movie_list.dart';

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
                  Padding(
                    padding: context.horizontalPaddingLow,
                    child: HomeTitle(
                      title: AppLocalizations.of(context)
                              ?.translate("upcoming_movie_title") ??
                          "",
                      onPress: () {
                        context.read<ExploreCubit>().seeAllUpcomingMovies();
                      },
                    ),
                  ),
                  context.emptySizedHeightBoxLow,
                  _UpcomingMoviesList(upcomingMovies: state.upcomingMovies),
                  context.emptySizedHeightBoxLow3x,
                  _GenreList(state: state),
                  context.emptySizedHeightBoxLow3x,
                  _DiscoverMovieList(movies: state.discoverMovies),
                ],
              ),
            ),
          );
        } else if (state is SeeAllUpcomingMovies) {
          return MoviesGridview(
            isVisible: true,
            title:
                AppLocalizations.instance.translate("upcoming_movie_title") ??
                    "",
            scrollController: state.scrollController,
            movies: state.movies,
            onBackPressed: () {
              context.read<ExploreCubit>().loadExplore();
            },
          );
        } else if (state is DiscoverNewMovies) {
          return MoviesGridview(
            isVisible: true,
            title: AppLocalizations.instance.translate("discover_page_title") ??
                "",
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
