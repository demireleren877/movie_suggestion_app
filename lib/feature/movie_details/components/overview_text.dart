part of "../detail_screen.dart";

class _OverviewText extends StatelessWidget {
  const _OverviewText({
    Key? key,
    required this.detail,
  }) : super(key: key);
  final MovieDetail detail;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.paddingNormal,
      child: Text(
        detail.overview,
        style: context.textTheme.bodyText1?.copyWith(
          fontSize: 20.sp,
          fontFamily: GoogleFonts.quicksand().fontFamily,
        ),
      ),
    );
  }
}
