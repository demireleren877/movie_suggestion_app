part of '../../home_screen.dart';

class _MovieImage extends StatelessWidget {
  const _MovieImage({
    Key? key,
    required this.image,
  }) : super(key: key);

  final String image;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: CachedNetworkImage(
        imageUrl: ApiConstants.imageurl + image,
        fit: BoxFit.cover,
      ),
    );
  }
}
