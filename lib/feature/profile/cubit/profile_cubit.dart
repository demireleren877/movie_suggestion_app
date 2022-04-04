import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:movie_application/core/cache/cache_manager.dart';
import 'package:movie_application/core/constants/hive_constants.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(UserNotLoggedIn());
  final CacheManager _cacheManager = CacheManager();

  void saveUser(String user) {
    _cacheManager.saveUser(user);
    emit(ProfileLoaded(Hive.box(HiveConstants.hiveMovieList), user));
  }

  void loadProfile() {
    if (_cacheManager.getUser() != null) {
      emit(ProfileLoaded(Hive.box(HiveConstants.hiveMovieList),
          _cacheManager.getUser() ?? ""));
    } else {
      emit(UserNotLoggedIn());
    }
  }
}
