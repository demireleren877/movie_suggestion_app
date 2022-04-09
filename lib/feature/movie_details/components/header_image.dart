part of "../detail_screen.dart";

class _HeaderImage extends StatelessWidget {
  const _HeaderImage({
    Key? key,
    required this.detail,
  }) : super(key: key);

  final MovieDetail detail;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: ApiConstants.imageurl + detail.posterPath,
      height: context.height * 0.5,
      width: double.infinity,
      fit: BoxFit.fitWidth,
    );
  }
}
