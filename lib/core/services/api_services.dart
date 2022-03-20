import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movie_application/core/models/popular_movie_model.dart';

Future<List<Movie>?> getPopularMoviesFromApi() async {
  String url =
      "https://api.themoviedb.org/3/movie/popular?api_key=563bef0fff48f59e1353e61b6458f472";
  final response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    final json = jsonDecode(response.body);
    var movies = json["results"] as List;
    List<Movie> movieList =
        movies.map((movie) => Movie.fromJson(movie)).toList();
    return movieList;
  }
  return null;
}
