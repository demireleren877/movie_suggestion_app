part of "../../home_screen.dart";

class _MovieTitle extends StatelessWidget {
  const _MovieTitle({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Text(
        title,
        style: context.textTheme.headline6?.copyWith(fontSize: 22.sp),
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
      ),
    );
  }
}
