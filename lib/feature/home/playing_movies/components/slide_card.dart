part of '../../home_screen.dart';

class SlideCard extends StatelessWidget {
  const SlideCard({
    Key? key,
    required this.image,
    required this.title,
    required this.voteAverage,
    required this.movieId,
  }) : super(key: key);

  final String image;
  final int movieId;
  final String title;
  final String voteAverage;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.navigateToPage(
          DetailScreen(
            movieId: movieId,
          ),
        );
      },
      child: Stack(
        fit: StackFit.expand,
        children: [
          _MovieImage(image: image),
          const _SliderShadow(),
          Positioned(
            child: SizedBox(
              width: context.width * 0.9,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _MovieTitle(title: title),
                  _VoteRow(voteAverage: voteAverage),
                ],
              ),
            ),
            bottom: 5.h,
            left: 15.w,
          )
        ],
      ),
    );
  }
}
