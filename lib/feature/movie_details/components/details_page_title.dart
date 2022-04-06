part of "../detail_screen.dart";

class _DetailsPageTitle extends StatelessWidget {
  const _DetailsPageTitle({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.horizontalPaddingNormal,
      child: Text(
        title,
        style: context.textTheme.headline5?.copyWith(
          fontSize: 24.sp,
        ),
      ),
    );
  }
}
