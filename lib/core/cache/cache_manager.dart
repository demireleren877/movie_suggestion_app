import 'package:hive_flutter/hive_flutter.dart';
import 'package:movie_application/core/constants/hive_constants.dart';

import '../models/movie_model.dart';

abstract class ICacheManager<T> {
  T? getMovieHive(int key, Box box);
  void saveMovieHive(T item, Box box);
  void deleteMovieHive(int key, Box box);
  void deleteAllMovieHives(Box box);
  void saveUser(String user);
  String? getUser();
}

class CacheManager implements ICacheManager<Movie> {
  @override
  void saveMovieHive(Movie movie, Box box) {
    box.put(movie.id, movie);
  }

  @override
  void deleteMovieHive(int key, Box box) {
    box.delete(key);
  }

  @override
  void deleteAllMovieHives(Box box) {
    box.clear();
  }

  @override
  Movie? getMovieHive(int key, Box box) {
    return box.get(key);
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
