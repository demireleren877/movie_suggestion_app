part of 'profile_cubit.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object> get props => [];
}

class ProfileLoaded extends ProfileState {
  final Box<Movie> movieBox;
  const ProfileLoaded(this.movieBox);
}
