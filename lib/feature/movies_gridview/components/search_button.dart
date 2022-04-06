import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../cubit/all_movies_cubit.dart';

class SearchButton extends StatelessWidget {
  const SearchButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      iconSize: 30.sp,
      splashRadius: 5,
      icon: context.watch<AllMoviesCubit>().isSearching
          ? const Icon(Icons.clear)
          : const Icon(Icons.search),
      onPressed: () {
        context.read<AllMoviesCubit>().onSearchPressed();
      },
    );
  }
}
