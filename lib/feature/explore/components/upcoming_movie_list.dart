part of "../explore_page.dart";

class _UpcomingMoviesList extends StatelessWidget {
  const _UpcomingMoviesList({
    Key? key,
    required this.upcomingMovies,
  }) : super(key: key);

  final List<Movie> upcomingMovies;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.dynamicHeight(0.38),
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: upcomingMovies.length,
        itemBuilder: (BuildContext context, int index) {
          return MovieCard(
            index: index,
            movies: upcomingMovies,
          );
        },
      ),
    );
  }
}
