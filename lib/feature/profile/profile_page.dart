import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:kartal/kartal.dart';
import 'package:movie_application/core/colors/app_colors.dart';
import 'package:movie_application/core/components/centered_progress.dart';
import 'package:movie_application/core/constants/hive_constants.dart';
import 'package:movie_application/feature/profile/cubit/profile_cubit.dart';
import 'package:share_plus/share_plus.dart';
import '../../core/cache/cache_manager.dart';
import '../../core/constants/api_constants.dart';
import '../../core/localization/app_localizations.dart';
import '../../core/localization/cubit/localization_cubit.dart';
import '../movie_details/detail_screen.dart';
part 'components/remove_slidable.dart';
part 'components/share_slidable.dart';
part 'components/movie_card.dart';
part 'components/animated_language_switcher.dart';
part 'components/get_user_screen.dart';
part 'components/movie_list_item.dart';
part 'components/movies_tab_view.dart';
part 'components/reminders_tab_view.dart';

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
          return _GetUser();
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
      actions: const [_AnimatedLanguageSwitcher()],
      backgroundColor: AppColors.transparent,
      bottom: _buildTabBar(context),
    );
  }

  TabBarView _buildTabBarView(BuildContext context) {
    return TabBarView(
      physics: const BouncingScrollPhysics(),
      children: [
        _MoviesTabView(cacheManager: _cacheManager),
        _RemindersTabView(cacheManager: _cacheManager)
      ],
    );
  }

  TabBar _buildTabBar(BuildContext context) {
    return TabBar(
      padding: context.paddingNormal,
      labelColor: AppColors.amber,
      unselectedLabelColor: AppColors.grey,
      indicatorColor: AppColors.amber,
      indicator: BoxDecoration(
        borderRadius: context.lowBorderRadius,
        border: Border.all(
          color: AppColors.amber,
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
