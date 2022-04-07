part of "../profile_page.dart";

class _ShareSlidable extends StatelessWidget {
  const _ShareSlidable({
    Key? key,
    required this.cacheManager,
    required this.movieBox,
    required this.index,
  }) : super(key: key);

  final CacheManager cacheManager;
  final Box movieBox;
  final int index;

  @override
  Widget build(BuildContext context) {
    return SlidableAction(
      autoClose: true,
      backgroundColor: AppColors.green,
      icon: Icons.share,
      label: AppLocalizations.instance.translate('share_movie_title') ?? "",
      onPressed: (context) {
        Share.share(
          ApiConstants.shareUrl + movieBox.getAt(index).id.toString(),
        );
      },
    );
  }
}
