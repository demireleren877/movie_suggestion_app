part of 'for_you_cubit.dart';

abstract class ForYouState extends Equatable {
  const ForYouState();

  @override
  List<Object> get props => [];
}

class ForYouInitial extends ForYouState {}

class ForYouLoading extends ForYouState {}

class ForYouLoaded extends ForYouState {
  final List<Movie> movies;
  final ScrollController scrollController;

  const ForYouLoaded({
    required this.scrollController,
    required this.movies,
  });

  @override
  List<Object> get props => [movies];
}

class ForYouError extends ForYouState {}
