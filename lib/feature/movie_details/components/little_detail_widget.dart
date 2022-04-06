part of "../detail_screen.dart";

class _LittleMovieDetailWidget extends StatelessWidget {
  const _LittleMovieDetailWidget(
      {Key? key, required this.title, required this.text})
      : super(key: key);
  final String title;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(title, style: TextStyle(fontSize: 16.sp, color: Colors.amber)),
        context.emptySizedHeightBoxLow,
        Text(
          text,
          style: TextStyle(fontSize: 16.sp),
        ),
      ],
    );
  }
}
