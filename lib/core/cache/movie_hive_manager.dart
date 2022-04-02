import 'package:hive_flutter/hive_flutter.dart';

import '../models/movie_model.dart';

abstract class ICacheManager<T> {
  T? getMovieHive(String movieId);
  Future<void> saveMovieHive(Movie movie);
  Future<void> deleteMovieHive(String movieId);
  Future<void> deleteAllMovieHives();
}

class CacheManager implements ICacheManager<Movie> {
  final String _movieHiveName = 'movie_hive';

  @override
  Future<void> saveMovieHive(Movie movie) async {
    final movieHive = await Hive.openBox<Movie>(_movieHiveName);
    movieHive.put(movie.id, movie);
  }

  @override
  Future<void> deleteMovieHive(String movieId) async {
    final movieHive = await Hive.openBox<Movie>(_movieHiveName);
    movieHive.delete(movieId);
  }

  @override
  Future<void> deleteAllMovieHives() async {
    final movieHive = await Hive.openBox<Movie>(_movieHiveName);
    movieHive.deleteFromDisk();
  }

  @override
  Movie? getMovieHive(String movieId) {
    final movieHive = Hive.box(_movieHiveName);
    return movieHive.get(movieId);
  }
}
