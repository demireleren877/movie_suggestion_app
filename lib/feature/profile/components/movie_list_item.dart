part of "../profile_page.dart";

class _MovieListItem extends StatelessWidget {
  const _MovieListItem({
    Key? key,
    required this.movieBox,
    required this.index,
    required this.cacheManager,
    this.additionalAction,
  }) : super(key: key);
  final Box movieBox;
  final int index;
  final CacheManager cacheManager;
  final VoidCallback? additionalAction;

  @override
  Widget build(BuildContext context) {
    return SlidableAutoCloseBehavior(
      child: Slidable(
        endActionPane: ActionPane(
          extentRatio: 0.25,
          children: [
            _ShareSlidable(
              cacheManager: cacheManager,
              movieBox: movieBox,
              index: index,
            ),
          ],
          motion: const ScrollMotion(),
        ),
        startActionPane: ActionPane(
          extentRatio: 0.25,
          children: [
            _RemoveSlidable(
              additionalAction: additionalAction,
              cacheManager: cacheManager,
              movieBox: movieBox,
              index: index,
            ),
          ],
          motion: const ScrollMotion(),
        ),
        child: GestureDetector(
          onTap: () {
            context.navigateToPage(
              DetailScreen(movieId: movieBox.getAt(index).id),
            );
          },
          child: _MovieCardWidget(
            movieBox: movieBox,
            index: index,
          ),
        ),
      ),
    );
  }
}
