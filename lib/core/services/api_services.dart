import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movie_application/core/models/movie_detail_model.dart';
import 'package:movie_application/core/models/movie_images_model.dart';
import 'package:movie_application/core/models/popular_movie_model.dart';

import '../../feature/movie_tinder/components/image_card.dart';
import '../constants/api_constants.dart';

class ApiServices {
  Future<List<ImageCard>> getMovieTinderFromApi() async {
    String url = ApiConstants.baseUrl +
        ApiConstants.popularMovies +
        ApiConstants.apiKeyParam +
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

  Future<List<Movie>> getMoviesFromApi(String movieType, int page) async {
    String url = ApiConstants.baseUrl +
        movieType +
        ApiConstants.apiKeyParam +
        ApiConstants.apiKey +
        ApiConstants.apiPageParam +
        page.toString();
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

  Future<MovieDetail> getMovieDetails(int id) async {
    String url = ApiConstants.baseUrl +
        "/movie/" +
        id.toString() +
        ApiConstants.apiKeyParam +
        ApiConstants.apiKey;
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      MovieDetail movieDetail = MovieDetail.fromJson(jsonDecode(response.body));
      movieDetail.movieImage = await getMovieImages(id);
      return movieDetail;
    }
    return MovieDetail(
        posterPath: "",
        id: "",
        title: "title",
        backdropPath: "backdropPath",
        budget: "budget",
        originalTitle: "originalTitle",
        overview: "overview",
        releaseDate: "releaseDate",
        runtime: "runtime",
        voteAverage: "voteAverage",
        voteCount: "voteCount",
        genres: []);
  }

  Future<MovieImage> getMovieImages(int id) async {
    String url = ApiConstants.baseUrl +
        "/movie/" +
        id.toString() +
        "/images" +
        ApiConstants.apiKeyParam +
        ApiConstants.apiKey;
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      MovieImage movieImage = MovieImage.fromJson(jsonDecode(response.body));
      return movieImage;
    }
    return const MovieImage(
      backdrops: [],
      posters: [],
    );
  }
}
