// ignore_for_file: must_be_immutable

part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  List<Movie>? movies;
  HomeLoaded({required this.movies});
}

class HomeError extends HomeState {}
