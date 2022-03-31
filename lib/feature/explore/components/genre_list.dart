import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kartal/kartal.dart';

import '../cubit/explore_cubit.dart';

class GenreList extends StatelessWidget {
  const GenreList({
    Key? key,
    required this.state,
  }) : super(key: key);
  final ExploreLoaded state;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: context.horizontalPaddingLow,
      height: context.dynamicHeight(0.05),
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: state.genres.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              index != 0
                  ? context
                      .read<ExploreCubit>()
                      .changeGenre(state.genres[index].id, state)
                  : context.read<ExploreCubit>().discoverMovies();
            },
            child: Container(
              padding: context.paddingLow,
              margin: context.horizontalPaddingLow,
              decoration: BoxDecoration(
                borderRadius: context.normalBorderRadius,
                border: Border.all(
                  color: index != 0 ? Colors.white : Colors.blue,
                ),
                color: state.genres[index].id ==
                        context.read<ExploreCubit>().selectedGenre
                    ? Colors.white70
                    : const Color(0xFF252a31),
              ),
              height: context.dynamicHeight(0.05),
              child: Center(
                child: Text(
                  state.genres[index].name,
                  style: context.textTheme.bodyText1?.copyWith(
                    fontSize: 16.sp,
                    color: state.genres[index].id ==
                            context.read<ExploreCubit>().selectedGenre
                        ? const Color(0xFF252a31)
                        : Colors.white70,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
