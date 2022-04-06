part of "../profile_page.dart";

class _AnimatedLanguageSwitcher extends StatelessWidget {
  const _AnimatedLanguageSwitcher({Key? key}) : super(key: key);
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
        width: context.dynamicWidth(0.24),
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
                  ? 0
                  : context.dynamicWidth(0.12),
              right: AppLocalizations.instance.isEnLocale
                  ? context.dynamicWidth(0.12)
                  : 0,
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
                                  ?.copyWith(fontSize: 22.sp),
                            ),
                          ],
                        )
                      : CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: context.dynamicHeight(0.025),
                          child: Text(
                            flag("tr"),
                            style: context.textTheme.headline4
                                ?.copyWith(fontSize: 22.sp),
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
