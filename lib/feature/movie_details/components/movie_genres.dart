part of "../detail_screen.dart";

class _MovieGenres extends StatelessWidget {
  const _MovieGenres({
    Key? key,
    required this.detail,
  }) : super(key: key);
  final MovieDetail detail;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: detail.genres.isNotEmpty ? 30.h : 0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: detail.genres.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.white),
              borderRadius: context.lowBorderRadius,
            ),
            margin: context.horizontalPaddingLow,
            padding: context.horizontalPaddingLow,
            child: Center(
              child: Text(
                detail.genres[index]['name'],
                style: TextStyle(fontSize: 16.sp),
              ),
            ),
          );
        },
      ),
    );
  }
}
