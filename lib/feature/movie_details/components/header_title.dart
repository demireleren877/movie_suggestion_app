part of "../detail_screen.dart";

class _HeaderTitle extends StatelessWidget {
  _HeaderTitle({
    Key? key,
    required this.detail,
  }) : super(key: key);

  final MovieDetail detail;
  final CacheManager _cacheManager = CacheManager();
  final NotificationService _notificationService = NotificationService();

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 10.w,
      bottom: 20.h,
      child: Row(
        children: [
          SizedBox(
            width: context.width * 0.7,
            child: Text(
              detail.title + "  " + '(${detail.releaseDate.split('-')[0]})',
              style: context.textTheme.headline4?.copyWith(
                fontSize: 28.sp,
                color: AppColors.white,
                fontFamily: GoogleFonts.josefinSans().fontFamily,
              ),
            ),
          ),
          context.emptySizedWidthBoxNormal,
          GestureDetector(
            onTap: () async {
              await launch("https://www.youtube.com/watch?v=${detail.videoId}");
            },
            child: Icon(
              Icons.play_circle_outline,
              color: AppColors.white,
              size: 40.sp,
            ),
          ),
          context.emptySizedWidthBoxLow,
          ReminderButton(
            movieId: int.parse(detail.id),
            onTap: () {
              isOkToRemind() ? addReminder(context) : showErrorDialog(context);
            },
          )
        ],
      ),
    );
  }

  void addReminder(BuildContext context) {
    Hive.box(HiveConstants.reminderList).keys.contains(int.parse(detail.id))
        ? _cacheManager.deleteMovieHive(
            int.parse(detail.id),
            Hive.box(HiveConstants.reminderList),
          )
        : showTimePicker(
            context: context,
            initialTime: TimeOfDay.now(),
          ).then(
            (value) {
              _notificationService.saveNotif(
                int.parse(detail.releaseDate.split('-')[0]),
                int.parse(detail.releaseDate.split('-')[1]),
                int.parse(detail.releaseDate.split('-')[2]),
                value!.hour,
                value.minute,
                detail.title,
                ApiConstants.imageurl + detail.posterPath,
                int.parse(detail.id),
              );
              _cacheManager.saveMovieHive(
                Movie(
                  runtime: 0,
                  backdropPath: "",
                  id: int.parse(detail.id),
                  originalLanguage: "",
                  originalTitle: detail.originalTitle,
                  overview: detail.overview,
                  posterPath: detail.posterPath,
                  releaseDate: detail.releaseDate,
                  title: detail.title,
                  video: false,
                  voteCount: 0,
                  voteAverage: "",
                ),
                Hive.box(
                  HiveConstants.reminderList,
                ),
              );
            },
          );
  }

  bool isOkToRemind() {
    return int.parse(detail.releaseDate.split("-")[1]) >=
            DateTime.now().month &&
        int.parse(detail.releaseDate.split("-")[0]) >= DateTime.now().year &&
        int.parse(detail.releaseDate.split("-")[2]) >= DateTime.now().day;
  }

  void showErrorDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
              AppLocalizations.instance.translate("already_released_title") ??
                  ""),
          content: Text(
              AppLocalizations.instance.translate("already_released_body") ??
                  ""),
          actions: [
            TextButton(
              child: Text(AppLocalizations.instance
                      .translate("already_released_button") ??
                  ""),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }
}
