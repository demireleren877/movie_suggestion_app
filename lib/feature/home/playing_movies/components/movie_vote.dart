import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kartal/kartal.dart';

class VoteRow extends StatelessWidget {
  const VoteRow({
    Key? key,
    required this.voteAverage,
  }) : super(key: key);

  final String voteAverage;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.star, size: 20.sp, color: Colors.yellow),
        Text(
          voteAverage,
          style: context.textTheme.subtitle1,
        ),
      ],
    );
  }
}
