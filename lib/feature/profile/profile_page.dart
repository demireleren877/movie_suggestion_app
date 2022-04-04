import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:kartal/kartal.dart';
import 'package:movie_application/core/components/centered_progress.dart';
import 'package:movie_application/core/constants/hive_constants.dart';
import 'package:movie_application/feature/profile/components/get_user_screen.dart';
import 'package:movie_application/feature/profile/cubit/profile_cubit.dart';

import '../../core/cache/cache_manager.dart';
import '../../core/localization/app_localizations.dart';
import 'components/animated_language_switcher.dart';
import 'components/movie_list_item.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({Key? key}) : super(key: key);
  final CacheManager _cacheManager = CacheManager();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        if (state is ProfileLoaded) {
          return DefaultTabController(
            length: 2,
            animationDuration: const Duration(milliseconds: 300),
            initialIndex: 0,
            child: Scaffold(
              appBar: _buildAppBar(context, state.user),
              body: _buildTabBarView(context),
            ),
          );
        } else if (state is UserNotLoggedIn) {
          return GetUser();
        } else {
          return const CenteredProgressIndicator();
        }
      },
    );
  }

  AppBar _buildAppBar(BuildContext context, String user) {
    return AppBar(
      title: Text(
        (AppLocalizations.instance.translate("hello_title") ?? "") +
            "\t $user,",
        style: context.textTheme.headline6?.copyWith(
          fontFamily: GoogleFonts.josefinSans().fontFamily,
          fontSize: 32.sp,
        ),
      ),
      toolbarHeight: 100.h,
      actions: const [AnimatedLanguageSwitcher()],
      backgroundColor: Colors.transparent,
      bottom: _buildTabBar(context),
    );
  }

  TabBarView _buildTabBarView(BuildContext context) {
    return TabBarView(
      physics: const BouncingScrollPhysics(),
      children: [
        Container(
          padding: context.paddingLow,
          height: context.dynamicHeight(0.9),
          child: ValueListenableBuilder(
            valueListenable: Hive.box(HiveConstants.hiveMovieList).listenable(),
            builder: (context, Box movieBox, _) => ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: movieBox.length,
              itemBuilder: (BuildContext context, int index) {
                return MovieListItem(
                  movieBox: movieBox,
                  index: index,
                  cacheManager: _cacheManager,
                );
              },
            ),
          ),
        ),
        const Center(
          child: Text('My Series'),
        ),
      ],
    );
  }

  TabBar _buildTabBar(BuildContext context) {
    return TabBar(
      padding: context.paddingNormal,
      labelColor: Colors.amber,
      unselectedLabelColor: Colors.grey,
      indicatorColor: Colors.amber,
      indicator: BoxDecoration(
        borderRadius: context.lowBorderRadius,
        border: Border.all(
          color: Colors.amber,
          width: 2.0,
        ),
      ),
      unselectedLabelStyle:
          context.textTheme.headline6?.copyWith(fontSize: 20.sp),
      labelStyle: context.textTheme.headline6?.copyWith(fontSize: 20.sp),
      tabs: [
        Tab(
          height: context.dynamicHeight(0.06),
          text:
              AppLocalizations.instance.translate('my_movie_list_title') ?? "",
        ),
        Tab(
          text:
              AppLocalizations.instance.translate('movie_reminder_title') ?? "",
        ),
      ],
    );
  }
}
