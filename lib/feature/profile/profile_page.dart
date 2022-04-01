import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kartal/kartal.dart';

import '../../core/localization/app_localizations.dart';
import '../../core/localization/cubit/localization_cubit.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String flag(String code) => code.toUpperCase().replaceAllMapped(
      RegExp(r'[A-Z]'),
      (match) => String.fromCharCode(match.group(0)!.codeUnitAt(0) + 127397));

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      animationDuration: const Duration(milliseconds: 300),
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          bottom: TabBar(
            padding: context.paddingNormal,
            labelColor: Colors.amber,
            unselectedLabelColor: Colors.grey,
            indicatorColor: Colors.amber,
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
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
                text: AppLocalizations.instance.translate("watchlists_title") ??
                    "",
              ),
              Tab(
                text:
                    AppLocalizations.instance.translate("settings_title") ?? "",
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            const Center(
              child: Text('My Watchlist'),
            ),
            Center(
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 1000),
                height: context.dynamicHeight(0.08),
                width: context.dynamicWidth(0.38),
                decoration: BoxDecoration(
                  color: AppLocalizations.instance.isEnLocale
                      ? Colors.blue.shade800
                      : Colors.red.shade800,
                  borderRadius: context.highBorderRadius,
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    AnimatedPositioned(
                      curve: Curves.easeIn,
                      left: AppLocalizations.instance.isEnLocale
                          ? context.dynamicWidth(0.22)
                          : 0,
                      right: AppLocalizations.instance.isEnLocale
                          ? 0
                          : context.dynamicWidth(0.22),
                      duration: const Duration(milliseconds: 1000),
                      child: GestureDetector(
                        onTap: () {
                          if (AppLocalizations.instance.isEnLocale) {
                            context.read<LocalizationCubit>().toTurkish();
                          } else {
                            context.read<LocalizationCubit>().toEnglish();
                          }
                        },
                        child: AnimatedSwitcher(
                          duration: const Duration(milliseconds: 1000),
                          transitionBuilder:
                              (Widget child, Animation<double> animation) {
                            return ScaleTransition(
                              scale: animation,
                              child: child,
                            );
                          },
                          child: AppLocalizations.instance.isEnLocale
                              ? Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    CircleAvatar(
                                      backgroundColor: Colors.white,
                                      radius: context.dynamicHeight(0.035),
                                    ),
                                    Text(
                                      flag("us"),
                                      style: context.textTheme.headline3
                                          ?.copyWith(fontSize: 30.sp),
                                    ),
                                  ],
                                )
                              : CircleAvatar(
                                  backgroundColor: Colors.white,
                                  radius: context.dynamicHeight(0.035),
                                  child: Text(
                                    flag("tr"),
                                    style: context.textTheme.headline3
                                        ?.copyWith(fontSize: 30.sp),
                                  ),
                                ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
