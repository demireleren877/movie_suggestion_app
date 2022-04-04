import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:kartal/kartal.dart';
import 'package:movie_application/feature/movie_details/detail_screen.dart';
import '../../../core/cache/cache_manager.dart';
import 'movie_card.dart';
import 'remove_slidable.dart';
import 'share_slidable.dart';

class MovieListItem extends StatelessWidget {
  const MovieListItem(
      {Key? key,
      required this.movieBox,
      required this.index,
      required this.cacheManager})
      : super(key: key);
  final Box movieBox;
  final int index;
  final CacheManager cacheManager;

  @override
  Widget build(BuildContext context) {
    return SlidableAutoCloseBehavior(
      child: Slidable(
        endActionPane: ActionPane(
          extentRatio: 0.25,
          children: [
            ShareSlidable(
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
            RemoveSlidable(
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
          child: MovieCardWidget(
            movieBox: movieBox,
            index: index,
          ),
        ),
      ),
    );
  }
}
