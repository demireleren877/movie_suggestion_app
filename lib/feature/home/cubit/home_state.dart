part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final List<SlideCard> playingMovies;
  final List<Movie> popularMovies;
  HomeLoaded({required this.playingMovies, required this.popularMovies});
}

class SeeAllPopularMovies extends HomeState {
  final List<Movie> popularMovies;
  final ScrollController scrollController;
  SeeAllPopularMovies({
    required this.popularMovies,
    required this.scrollController,
  });
}

class SeeAllPlayingMovies extends HomeState {
  final List<Movie> playingMovies;
  final ScrollController scrollController;
  SeeAllPlayingMovies({
    required this.playingMovies,
    required this.scrollController,
  });
}

class HomeError extends HomeState {}
