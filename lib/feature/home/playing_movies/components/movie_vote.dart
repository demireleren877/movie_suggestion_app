part of "../../home_screen.dart";

class _VoteRow extends StatelessWidget {
  const _VoteRow({
    Key? key,
    required this.voteAverage,
  }) : super(key: key);

  final String voteAverage;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.star, size: 20.sp, color: Colors.yellow),
        Text(
          voteAverage,
          style: context.textTheme.subtitle1?.copyWith(fontSize: 18.sp),
        ),
      ],
    );
  }
}
