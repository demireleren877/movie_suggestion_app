import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hive_flutter/adapters.dart';

import '../../../core/cache/movie_hive_manager.dart';
import '../../../core/localization/app_localizations.dart';

class RemoveSlidable extends StatelessWidget {
  const RemoveSlidable({
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
      backgroundColor: Colors.red,
      icon: Icons.delete_forever_outlined,
      flex: 15,
      label: AppLocalizations.instance.translate('remove_movie_title') ?? "",
      onPressed: (context) {
        cacheManager.deleteMovieHive(
          movieBox.keyAt(index),
        );
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
