part of 'movie_details_cubit.dart';

abstract class MovieDetailsState extends Equatable {
  const MovieDetailsState();

  @override
  List<Object> get props => [];
}

class MovieDetailsInitial extends MovieDetailsState {}

class MovieDetailLoading extends MovieDetailsState {}

class MovieDetailError extends MovieDetailsState {}

class MovieDetailLoaded extends MovieDetailsState {
  final MovieDetail detail;
  const MovieDetailLoaded(this.detail);
}
