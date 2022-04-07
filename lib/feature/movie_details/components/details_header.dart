part of '../detail_screen.dart';

class _DetailsHeader extends StatelessWidget {
  _DetailsHeader({
    Key? key,
    required this.detail,
  }) : super(key: key);

  final MovieDetail detail;
  final CacheManager _cacheManager = CacheManager();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        HeaderImage(detail: detail),
        const HeaderShadow(),
        HeaderTitle(detail: detail),
        IconButton(
          color: AppColors.white,
          icon: Icon(
            Icons.arrow_back,
            size: 30.sp,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        Positioned(
          right: 0,
          child: BookmarkButton(
            movieId: int.parse(detail.id),
            onTap: () {
              Hive.box(HiveConstants.hiveMovieList)
                      .keys
                      .contains(int.parse(detail.id))
                  ? _cacheManager.deleteMovieHive(int.parse(detail.id),
                      Hive.box(HiveConstants.hiveMovieList))
                  : _cacheManager.saveMovieHive(
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
                      Hive.box(HiveConstants.hiveMovieList));
            },
          ),
        ),
      ],
    );
  }
}

class HeaderTitle extends StatelessWidget {
  HeaderTitle({
    Key? key,
    required this.detail,
  }) : super(key: key);

  final MovieDetail detail;
  final CacheManager _cacheManager = CacheManager();
  final NotificationService _notificationService = NotificationService();

  void addReminder(BuildContext context) {
    Hive.box(HiveConstants.reminderList).keys.contains(int.parse(detail.id))
        ? _cacheManager.deleteMovieHive(
            int.parse(detail.id), Hive.box(HiveConstants.reminderList))
        : showTimePicker(
            context: context,
            initialTime: TimeOfDay.now(),
          ).then((value) {
            _notificationService.saveNotif(
                int.parse(detail.releaseDate.split('-')[0]),
                int.parse(detail.releaseDate.split('-')[1]),
                int.parse(detail.releaseDate.split('-')[2]),
                value!.hour,
                value.minute,
                detail.title,
                ApiConstants.imageurl + detail.posterPath,
                int.parse(detail.id));
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
          });
  }

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
              addReminder(context);
            },
          )
        ],
      ),
    );
  }
}

class HeaderShadow extends StatelessWidget {
  const HeaderShadow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.height * 0.5,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [
            const Color(0xFF252a31).withOpacity(1),
            const Color(0xFF252a31).withOpacity(0.0),
            const Color(0xFF252a31).withOpacity(0.3),
            const Color(0xFF252a31).withOpacity(0.15),
          ],
        ),
      ),
    );
  }
}

class HeaderImage extends StatelessWidget {
  const HeaderImage({
    Key? key,
    required this.detail,
  }) : super(key: key);

  final MovieDetail detail;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      ApiConstants.imageurl + detail.posterPath,
      height: context.height * 0.5,
      width: double.infinity,
      fit: BoxFit.fitWidth,
    );
  }
}
