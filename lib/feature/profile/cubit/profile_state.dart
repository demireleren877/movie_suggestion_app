part of 'profile_cubit.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object> get props => [];
}

class UserNotLoggedIn extends ProfileState {}

class ProfileLoaded extends ProfileState {
  final Box movieBox;
  final String user;
  const ProfileLoaded(this.movieBox, this.user);
}
