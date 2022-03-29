import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
          title: "Budget",
          text: "\$" + _currencyFormatter.format(int.parse(detail.budget)),
        ),
        LittleMovieDetailWidget(
          title: "Runtime",
          text: detail.runtime + " min",
        ),
        LittleMovieDetailWidget(
          title: "Release Date",
          text: detail.releaseDate,
        ),
      ],
    );
  }
}
