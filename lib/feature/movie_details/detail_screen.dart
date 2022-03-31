import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';
import 'package:movie_application/core/components/centered_progress.dart';
import 'package:movie_application/core/components/divider.dart';
import 'package:movie_application/core/localization/app_localizations.dart';
import 'package:movie_application/feature/movie_details/components/details_header.dart';
import 'package:movie_application/feature/movie_details/components/details_page_title.dart';
import 'package:movie_application/feature/movie_details/cubit/movie_details_cubit.dart';

import 'components/cast_list.dart';
import 'components/little_detail_list.dart';
import 'components/movie_genres.dart';
import 'components/overview_text.dart';
import 'components/screenshot_list.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key, required this.movieId}) : super(key: key);
  final int movieId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MovieDetailsCubit()..loadMovieDetail(movieId),
      child: BlocBuilder<MovieDetailsCubit, MovieDetailsState>(
        builder: (context, state) {
          if (state is MovieDetailsInitial) {
            return const CenteredProgressIndicator();
          } else if (state is MovieDetailLoading) {
            return const CenteredProgressIndicator();
          } else if (state is MovieDetailLoaded) {
            return Scaffold(
              body: Center(
                child: ListView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  children: [
                    DetailsHeader(detail: state.detail),
                    MovieGenres(detail: state.detail),
                    const DetailPageDivider(),
                    LittleMovieDetails(detail: state.detail),
                    const DetailPageDivider(),
                    DetailsPageTitle(
                        title:
                            AppLocalizations.instance.translate("overview") ??
                                ""),
                    OverviewText(detail: state.detail),
                    const DetailPageDivider(),
                    DetailsPageTitle(
                        title: AppLocalizations.instance
                                .translate("screenshots") ??
                            ""),
                    context.emptySizedHeightBoxLow3x,
                    ScreenshotList(detail: state.detail),
                    const DetailPageDivider(),
                    DetailsPageTitle(
                        title:
                            AppLocalizations.instance.translate("casts") ?? ""),
                    CastListWidget(detail: state.detail),
                    context.emptySizedHeightBoxLow3x,
                  ],
                ),
              ),
            );
          } else {
            return const Scaffold(
              body: Center(
                child: Text("Error"),
              ),
            );
          }
        },
      ),
    );
  }
}
