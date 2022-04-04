part of 'all_movies_cubit.dart';

abstract class AllMoviesState extends Equatable {
  const AllMoviesState();

  @override
  List<Object> get props => [];
}

class AllMoviesInitial extends AllMoviesState {}

class AllMoviesLoaded extends AllMoviesState {
  final String query;
  final List<Movie> movies;

  const AllMoviesLoaded({required this.query, required this.movies});

  @override
  List<Object> get props => [query];
}

class AllMoviesChangeButton extends AllMoviesState {}
