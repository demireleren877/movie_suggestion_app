import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';

import '../../core/localization/app_localizations.dart';
import 'components/animated_language_switcher.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      animationDuration: const Duration(milliseconds: 300),
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Merhaba Eren,',
            style: context.textTheme.headline6?.copyWith(
              fontFamily: GoogleFonts.josefinSans().fontFamily,
              fontSize: 32.sp,
            ),
          ),
          toolbarHeight: 100,
          actions: const [AnimatedLanguageSwitcher()],
          backgroundColor: Colors.transparent,
          bottom: TabBar(
            padding: context.paddingNormal,
            labelColor: Colors.amber,
            unselectedLabelColor: Colors.grey,
            indicatorColor: Colors.amber,
            indicator: BoxDecoration(
              borderRadius: context.normalBorderRadius,
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
                text: AppLocalizations.instance
                        .translate('my_movie_list_title') ??
                    "",
              ),
              Tab(
                text: AppLocalizations.instance
                        .translate('my_series_list_title') ??
                    "",
              ),
            ],
          ),
        ),
        body: const TabBarView(
          physics: BouncingScrollPhysics(),
          children: [
            Center(
              child: Text('My Watchlist'),
            ),
            Center(
              child: Text('My Series'),
            ),
          ],
        ),
      ),
    );
  }
}
