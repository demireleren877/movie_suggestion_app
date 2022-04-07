import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../colors/app_colors.dart';
import '../constants/hive_constants.dart';

class ReminderButton extends StatelessWidget {
  const ReminderButton({
    Key? key,
    required this.movieId,
    required this.onTap,
  }) : super(key: key);
  final int movieId;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: AppColors.transparent,
      onTap: onTap,
      child: ValueListenableBuilder(
        valueListenable: Hive.box(HiveConstants.reminderList).listenable(),
        builder: (context, Box box, _) => Icon(
          box.keys.contains(movieId) ? Icons.alarm_on : Icons.add_alarm,
          size: 40.sp,
        ),
      ),
    );
  }
}
