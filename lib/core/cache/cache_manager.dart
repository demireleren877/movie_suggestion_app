import 'package:hive_flutter/hive_flutter.dart';
import 'package:movie_application/core/constants/hive_constants.dart';

import '../models/movie_model.dart';

abstract class ICacheManager<T> {
  T? getMovieHive(int key);
  void saveMovieHive(T item);
  void deleteMovieHive(int key);
  void deleteAllMovieHives();
  void saveUser(String user);
  String? getUser();
}

class CacheManager implements ICacheManager<Movie> {
  @override
  void saveMovieHive(Movie movie) {
    final movieHive = Hive.box(HiveConstants.hiveMovieList);
    movieHive.put(movie.id, movie);
  }

  @override
  void deleteMovieHive(int key) {
    final movieHive = Hive.box(HiveConstants.hiveMovieList);
    movieHive.delete(key);
  }

  @override
  void deleteAllMovieHives() {
    final movieHive = Hive.box(HiveConstants.hiveMovieList);
    movieHive.clear();
  }

  @override
  Movie? getMovieHive(int key) {
    final movieHive = Hive.box(HiveConstants.hiveMovieList);
    return movieHive.get(key);
  }

  @override
  void saveUser(String user) {
    final userHive = Hive.box(HiveConstants.user);
    userHive.add(user);
  }

  @override
  String? getUser() {
    final userHive = Hive.box(HiveConstants.user);
    return userHive.isEmpty ? null : userHive.getAt(0);
  }
}
