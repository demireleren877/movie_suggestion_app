import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:intl/intl.dart';
import 'package:kartal/kartal.dart';
import 'package:movie_application/core/colors/app_colors.dart';
import 'package:movie_application/core/constants/url_constants.dart';
import '../../core/components/centered_progress.dart';
import '../../core/components/divider.dart';
import '../../core/localization/app_localizations.dart';
import './cubit/movie_details_cubit.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../core/cache/cache_manager.dart';
import '../../core/components/bookmark_button.dart';
import '../../core/components/image_view.dart';
import '../../core/components/reminder_button.dart';
import '../../core/constants/api_constants.dart';
import '../../core/constants/hive_constants.dart';
import '../../core/models/movie_detail_model.dart';
import '../../core/models/movie_model.dart';
import '../../core/services/notification_service.dart';
part 'components/little_detail_widget.dart';
part 'components/details_page_title.dart';
part 'components/little_detail_list.dart';
part 'components/movie_genres.dart';
part 'components/overview_text.dart';
part 'components/screenshot_list.dart';
part 'components/cast_list.dart';
part 'components/details_header.dart';

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
                    _DetailsHeader(detail: state.detail),
                    _MovieGenres(detail: state.detail),
                    const DetailPageDivider(),
                    _LittleMovieDetails(detail: state.detail),
                    const DetailPageDivider(),
                    _DetailsPageTitle(
                        title:
                            AppLocalizations.instance.translate("overview") ??
                                ""),
                    _OverviewText(detail: state.detail),
                    const DetailPageDivider(),
                    _DetailsPageTitle(
                        title: AppLocalizations.instance
                                .translate("screenshots") ??
                            ""),
                    context.emptySizedHeightBoxLow3x,
                    _ScreenshotList(detail: state.detail),
                    const DetailPageDivider(),
                    _DetailsPageTitle(
                        title:
                            AppLocalizations.instance.translate("casts") ?? ""),
                    _CastListWidget(detail: state.detail),
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
