import 'package:hive_flutter/hive_flutter.dart';
import 'package:movie_application/core/constants/hive_constants.dart';

import '../models/movie_model.dart';

abstract class ICacheManager<T> {
  T? getMovieHive(int key);
  void saveMovieHive(T item);
  void deleteMovieHive(int key);
  void deleteAllMovieHives();
}

class CacheManager implements ICacheManager<Movie> {
  @override
  void saveMovieHive(Movie movie) {
    final movieHive = Hive.box(HiveConstants.hiveMovieList);
    movieHive.add(movie);
  }

  @override
  void deleteMovieHive(int key) {
    final movieHive = Hive.box(HiveConstants.hiveMovieList);
    movieHive.delete(key);
  }

  @override
  void deleteAllMovieHives() {
    final movieHive = Hive.box(HiveConstants.hiveMovieList);
    movieHive.deleteFromDisk();
  }

  @override
  Movie? getMovieHive(int key) {
    final movieHive = Hive.box(HiveConstants.hiveMovieList);
    return movieHive.get(key);
  }
}
