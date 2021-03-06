part of "../explore_page.dart";

class _GenreList extends StatelessWidget {
  const _GenreList({
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
                  color: index != 0 ? AppColors.white : AppColors.blue,
                ),
                color: state.genres[index].id ==
                        context.read<ExploreCubit>().selectedGenre
                    ? AppColors.white70
                    : AppColors.genreColor,
              ),
              height: context.dynamicHeight(0.05),
              child: Center(
                child: Text(
                  state.genres[index].name,
                  style: context.textTheme.bodyText1?.copyWith(
                    fontSize: 16.sp,
                    color: state.genres[index].id ==
                            context.read<ExploreCubit>().selectedGenre
                        ? AppColors.genreColor
                        : AppColors.white70,
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
