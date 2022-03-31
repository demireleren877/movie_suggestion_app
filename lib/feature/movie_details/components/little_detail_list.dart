import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:movie_application/core/localization/app_localizations.dart';

import '../../../core/models/movie_detail_model.dart';
import 'little_detail_widget.dart';

class LittleMovieDetails extends StatelessWidget {
  LittleMovieDetails({
    Key? key,
    required this.detail,
  }) : super(key: key);
  final MovieDetail detail;
  final _currencyFormatter = NumberFormat("#,##0.00", "en_US");

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        LittleMovieDetailWidget(
          title: AppLocalizations.of(context)?.translate("budget") ?? "",
          text: "\$" + _currencyFormatter.format(int.parse(detail.budget)),
        ),
        LittleMovieDetailWidget(
          title: AppLocalizations.of(context)?.translate("runtime") ?? "",
          text: detail.runtime +
              (AppLocalizations.instance.translate("min") ?? ""),
        ),
        LittleMovieDetailWidget(
          title: AppLocalizations.of(context)?.translate("release_date") ?? "",
          text: detail.releaseDate,
        ),
      ],
    );
  }
}
