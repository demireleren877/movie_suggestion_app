part of '../home_screen.dart';

class _PopularMovieList extends StatelessWidget {
  const _PopularMovieList({
    Key? key,
    required this.popularMovies,
  }) : super(key: key);
  final List<Movie> popularMovies;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.dynamicHeight(0.38),
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: popularMovies.length,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return MovieCard(
            index: index,
            movies: popularMovies,
          );
        },
      ),
    );
  }
}
