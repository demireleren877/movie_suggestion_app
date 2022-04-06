part of "../home_screen.dart";

class _PlayingMoviesSlider extends StatelessWidget {
  const _PlayingMoviesSlider({
    Key? key,
    required this.state,
  }) : super(key: key);

  final HomeLoaded state;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: state.playingMovies,
      options: CarouselOptions(
        autoPlay: true,
        enlargeCenterPage: true,
        viewportFraction: 1,
        enableInfiniteScroll: true,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
