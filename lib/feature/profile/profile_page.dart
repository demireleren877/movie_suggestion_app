import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:kartal/kartal.dart';
import 'package:movie_application/core/constants/hive_constants.dart';

import '../../core/cache/movie_hive_manager.dart';
import '../../core/localization/app_localizations.dart';
import 'components/animated_language_switcher.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({Key? key}) : super(key: key);
  final CacheManager _cacheManager = CacheManager();

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
          toolbarHeight: 100.h,
          actions: const [AnimatedLanguageSwitcher()],
          backgroundColor: Colors.transparent,
          bottom: TabBar(
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
        body: TabBarView(
          physics: const BouncingScrollPhysics(),
          children: [
            Container(
              padding: context.paddingLow,
              height: context.dynamicHeight(0.9),
              child: ValueListenableBuilder(
                valueListenable:
                    Hive.box(HiveConstants.hiveMovieList).listenable(),
                builder: (context, Box movieBox, _) => ListView.builder(
                  itemCount: movieBox.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Slidable(
                      startActionPane: ActionPane(
                        extentRatio: 0.25,
                        children: [
                          Container(
                            color: Colors.red,
                            child: const Icon(Icons.delete_forever_outlined),
                          )
                        ],
                        motion: const ScrollMotion(),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          title: Text(
                            movieBox.getAt(index)?.title ?? '',
                            style: context.textTheme.headline6?.copyWith(
                              fontSize: 20.sp,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            const Center(
              child: Text('My Series'),
            ),
          ],
        ),
      ),
    );
  }
}
