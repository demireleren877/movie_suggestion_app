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

class HomeError extends HomeState {}
