part of "../detail_screen.dart";

class _CastListWidget extends StatelessWidget {
  const _CastListWidget({
    Key? key,
    required this.detail,
  }) : super(key: key);
  final MovieDetail detail;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.height * 0.25,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        padding: context.paddingLow,
        scrollDirection: Axis.horizontal,
        itemCount: detail.castList?.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () => context.navigateToPage(
              ImageViewer(
                image: detail.castList?[index].profilePath == ""
                    ? "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ3Id7Z-Fc6SazelMw-y_cu7CpzEFuwLMVz-Q&usqp=CAU"
                    : ApiConstants.imageurl +
                        detail.castList![index].profilePath,
              ),
            ),
            child: Padding(
              padding: context.horizontalPaddingLow,
              child: Column(
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: context.lowBorderRadius,
                      child: Image.network(
                        detail.castList?[index].profilePath == ""
                            ? "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ3Id7Z-Fc6SazelMw-y_cu7CpzEFuwLMVz-Q&usqp=CAU"
                            : ApiConstants.imageurl +
                                detail.castList![index].profilePath,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: context.height * 0.01,
                  ),
                  Text(
                    detail.castList?[index].name ?? "",
                    style: context.textTheme.bodyText1?.copyWith(
                      fontSize: 16.sp,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
