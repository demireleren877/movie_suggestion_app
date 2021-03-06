part of "../profile_page.dart";

class _RemoveSlidable extends StatelessWidget {
  const _RemoveSlidable({
    Key? key,
    required this.cacheManager,
    required this.movieBox,
    required this.index,
    this.additionalAction,
  }) : super(key: key);

  final CacheManager cacheManager;
  final Box movieBox;
  final int index;
  final VoidCallback? additionalAction;

  @override
  Widget build(BuildContext context) {
    return SlidableAction(
      autoClose: true,
      backgroundColor: AppColors.red,
      icon: Icons.delete_forever_outlined,
      flex: 15,
      label: AppLocalizations.instance.translate('remove_movie_title') ?? "",
      onPressed: (context) {
        if (additionalAction != null) {
          additionalAction;
        }
        cacheManager.deleteMovieHive(movieBox.keyAt(index), movieBox);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              AppLocalizations.instance.translate('movie_removed_snackbar') ??
                  "",
            ),
          ),
        );
      },
    );
  }
}
