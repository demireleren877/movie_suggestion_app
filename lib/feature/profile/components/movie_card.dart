import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:kartal/kartal.dart';

import '../../../core/constants/api_constants.dart';
import '../../../core/localization/app_localizations.dart';

class MovieCardWidget extends StatelessWidget {
  const MovieCardWidget({
    Key? key,
    required this.movieBox,
    required this.index,
  }) : super(key: key);

  final Box movieBox;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: context.paddingLow,
      height: context.height * 0.22,
      width: context.width,
      child: Row(
        children: [
          ClipRRect(
            borderRadius: context.lowBorderRadius,
            child: Image.network(
              ApiConstants.imageurl + movieBox.getAt(index).posterPath,
              fit: BoxFit.cover,
            ),
          ),
          context.emptySizedWidthBoxLow3x,
          SizedBox(
            width: context.width * 0.6,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  movieBox.getAt(index).title,
                  overflow: TextOverflow.ellipsis,
                  style: context.textTheme.headline6?.copyWith(
                    fontSize: 20.sp,
                  ),
                ),
                Text(
                  movieBox.getAt(index).overview == ""
                      ? AppLocalizations.instance.translate('no_data_text') ??
                          ""
                      : movieBox.getAt(index).overview,
                  maxLines: 5,
                  overflow: TextOverflow.ellipsis,
                  style: context.textTheme.bodySmall?.copyWith(
                    fontSize: 18.sp,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
