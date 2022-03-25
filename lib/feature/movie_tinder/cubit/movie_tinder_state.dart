// ignore_for_file: must_be_immutable

part of 'movie_tinder_cubit.dart';

@immutable
abstract class MovieTinderState {}

class MovieTinderInitial extends MovieTinderState {}

class MovieTinderLoading extends MovieTinderState {}

class MovieTinderLoaded extends MovieTinderState {
  List<ImageCard> movies;
  MovieTinderLoaded({required this.movies});
}

class MovieTinderError extends MovieTinderState {}
