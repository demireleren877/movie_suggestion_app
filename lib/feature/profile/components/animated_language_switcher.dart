import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kartal/kartal.dart';

import '../../../core/localization/app_localizations.dart';
import '../../../core/localization/cubit/localization_cubit.dart';

class AnimatedLanguageSwitcher extends StatelessWidget {
  const AnimatedLanguageSwitcher({Key? key}) : super(key: key);
  String flag(String code) => code.toUpperCase().replaceAllMapped(
      RegExp(r'[A-Z]'),
      (match) => String.fromCharCode(match.group(0)!.codeUnitAt(0) + 127397));

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedContainer(
        margin: EdgeInsets.only(right: ScreenUtil().setWidth(20)),
        duration: const Duration(milliseconds: 1000),
        height: context.dynamicHeight(0.06),
        width: context.dynamicWidth(0.25),
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
                  ? context.dynamicWidth(0.12)
                  : 0,
              right: AppLocalizations.instance.isEnLocale
                  ? 0
                  : context.dynamicWidth(0.12),
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
                              radius: context.dynamicHeight(0.025),
                            ),
                            Text(
                              flag("us"),
                              style: context.textTheme.headline3
                                  ?.copyWith(fontSize: 26.sp),
                            ),
                          ],
                        )
                      : CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: context.dynamicHeight(0.025),
                          child: Text(
                            flag("tr"),
                            style: context.textTheme.headline3
                                ?.copyWith(fontSize: 26.sp),
                          ),
                        ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
