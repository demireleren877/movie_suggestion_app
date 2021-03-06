part of 'explore_cubit.dart';

abstract class ExploreState extends Equatable {
  const ExploreState();

  @override
  List<Object> get props => [];
}

class ExploreInitial extends ExploreState {}

class ExploreLoading extends ExploreState {}

class ExploreLoaded extends ExploreState {
  final List<Movie> upcomingMovies;
  final List<Genre> genres;
  final List<Movie> discoverMovies;
  final int selectedGenre;
  const ExploreLoaded({
    required this.discoverMovies,
    required this.selectedGenre,
    required this.genres,
    required this.upcomingMovies,
  });
}

class DiscoverNewMovies extends ExploreState {
  final List<Movie> movies;
  final ScrollController scrollController;
  const DiscoverNewMovies({
    required this.movies,
    required this.scrollController,
  });
}

class SeeAllUpcomingMovies extends ExploreState {
  final List<Movie> movies;
  final ScrollController scrollController;
  const SeeAllUpcomingMovies({
    required this.movies,
    required this.scrollController,
  });
}

class ExploreError extends ExploreState {}
