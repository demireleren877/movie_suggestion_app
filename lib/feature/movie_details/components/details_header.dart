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
        _HeaderImage(detail: detail),
        const _HeaderShadow(),
        _HeaderTitle(detail: detail),
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
                      Hive.box(
                        HiveConstants.hiveMovieList,
                      ),
                    );
            },
          ),
        ),
      ],
    );
  }
}
