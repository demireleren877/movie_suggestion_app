import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:share_plus/share_plus.dart';

import '../../../core/cache/movie_hive_manager.dart';
import '../../../core/constants/api_constants.dart';
import '../../../core/localization/app_localizations.dart';

class ShareSlidable extends StatelessWidget {
  const ShareSlidable({
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
      backgroundColor: Colors.green,
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
