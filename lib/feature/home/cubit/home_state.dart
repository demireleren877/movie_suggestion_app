part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final List<SlideCard> playingMovies;
  HomeLoaded({required this.playingMovies});
}

class HomeError extends HomeState {}
