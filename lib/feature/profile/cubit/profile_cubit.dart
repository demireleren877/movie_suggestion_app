import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:movie_application/core/constants/hive_constants.dart';
import 'package:movie_application/core/models/movie_model.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileLoaded(Hive.box(HiveConstants.hiveMovieList)));
}
