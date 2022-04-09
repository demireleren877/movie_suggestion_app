part of "../profile_page.dart";

class _MoviesTabView extends StatelessWidget {
  const _MoviesTabView({Key? key, required this.cacheManager})
      : super(key: key);
  final CacheManager cacheManager;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: context.paddingLow,
      height: context.dynamicHeight(0.9),
      child: ValueListenableBuilder(
        valueListenable: Hive.box(HiveConstants.hiveMovieList).listenable(),
        builder: (context, Box movieBox, _) => movieBox.length != 0
            ? ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: movieBox.length,
                itemBuilder: (BuildContext context, int index) {
                  return _MovieListItem(
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
                    Icons.videocam_off_outlined,
                    size: 100.sp,
                  ),
                  context.emptySizedHeightBoxLow3x,
                  Text(
                    AppLocalizations.instance
                            .translate("empty_movie_list_title") ??
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
