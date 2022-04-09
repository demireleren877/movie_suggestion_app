part of "../profile_page.dart";

class _MovieCardWidget extends StatelessWidget {
  const _MovieCardWidget({
    Key? key,
    required this.movieBox,
    required this.index,
  }) : super(key: key);

  final Box movieBox;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: context.verticalPaddingLow,
      height: context.height * 0.22,
      width: context.width,
      child: Row(
        children: [
          ClipRRect(
            borderRadius: context.lowBorderRadius,
            child: CachedNetworkImage(
              imageUrl:
                  ApiConstants.imageurl + movieBox.getAt(index).posterPath,
              fit: BoxFit.cover,
            ),
          ),
          context.emptySizedWidthBoxLow3x,
          SizedBox(
            width: context.width * 0.6,
            child: SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
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
                    "( ${movieBox.getAt(index).releaseDate} )",
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
          ),
        ],
      ),
    );
  }
}
