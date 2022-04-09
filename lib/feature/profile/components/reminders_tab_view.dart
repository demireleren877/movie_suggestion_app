part of "../profile_page.dart";

class _RemindersTabView extends StatelessWidget {
  const _RemindersTabView({Key? key, required this.cacheManager})
      : super(key: key);
  final CacheManager cacheManager;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: context.paddingLow,
      height: context.dynamicHeight(0.9),
      child: ValueListenableBuilder(
        valueListenable: Hive.box(HiveConstants.reminderList).listenable(),
        builder: (context, Box movieBox, _) => movieBox.length != 0
            ? ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: movieBox.length,
                itemBuilder: (BuildContext context, int index) {
                  return _MovieListItem(
                    additionalAction: () {
                      AwesomeNotifications().cancel(
                        int.parse(movieBox.getAt(index).id),
                      );
                    },
                    movieBox: movieBox,
                    index: index,
                    cacheManager: cacheManager,
                  );
                },
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.alarm_off_outlined,
                    size: 100.sp,
                  ),
                  context.emptySizedHeightBoxLow3x,
                  Text(
                    AppLocalizations.instance
                            .translate("empty_reminder_list_title") ??
                        "",
                    style: context.textTheme.headline5?.copyWith(
                      fontFamily: GoogleFonts.josefinSans().fontFamily,
                    ),
                  )
                ],
              ),
      ),
    );
  }
}
