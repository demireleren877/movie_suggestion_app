import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kartal/kartal.dart';
import 'package:movie_application/core/localization/app_localizations.dart';

import '../cubit/all_movies_cubit.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45.h,
      child: Center(
        child: TextField(
          onChanged: ((value) => value != ""
              ? context.read<AllMoviesCubit>().onSearchChanged(value)
              : null),
          decoration: InputDecoration(
            floatingLabelAlignment: FloatingLabelAlignment.center,
            contentPadding: context.horizontalPaddingNormal,
            hintText: AppLocalizations.instance.translate("search_title"),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
