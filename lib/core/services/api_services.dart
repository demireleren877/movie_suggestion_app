import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movie_application/core/models/popular_movie_model.dart';

import '../../feature/movie_tinder/components/image_card.dart';
import '../constants/api_constants.dart';

class ApiServices {
  Future<List<ImageCard>> getMovieTinderFromApi() async {
    const String url = ApiConstants.baseUrl +
        ApiConstants.popularMovies +
        ApiConstants.apiParam +
        ApiConstants.apiKey;
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      var movies = json["results"] as List;
      List<Movie> movieList =
          movies.map((movie) => Movie.fromJson(movie)).toList();
      List<ImageCard>? swipeList = [];
      for (int i = 0; i < movieList.length; i++) {
        swipeList.add(ImageCard(
          i: i,
          imageUrl: movieList[i].posterPath,
        ));
      }
      return swipeList;
    }
    return [];
  }

  Future<List<Movie>> getMoviesFromApi(String movieType) async {
    String url = ApiConstants.baseUrl +
        movieType +
        ApiConstants.apiParam +
        ApiConstants.apiKey;
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      var movies = json["results"] as List;
      List<Movie> movieList =
          movies.map((movie) => Movie.fromJson(movie)).toList();
      return movieList;
    }
    return [];
  }
}
