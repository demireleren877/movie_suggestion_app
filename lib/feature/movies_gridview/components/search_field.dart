import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kartal/kartal.dart';

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
            hintText: 'Search any movie...',
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
