import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movie_application/core/models/cast_list_model.dart';
import 'package:movie_application/core/models/movie_detail_model.dart';
import 'package:movie_application/core/models/movie_images_model.dart';
import 'package:movie_application/core/models/movie_model.dart';

import '../../feature/movie_tinder/components/image_card.dart';
import '../constants/api_constants.dart';
import '../localization/app_localizations.dart';
import '../models/genre_model.dart';

class ApiServices {
  Future<List<ImageCard>> getMovieTinderFromApi() async {
    String url = ApiConstants.baseUrl +
        ApiConstants.popularMovies +
        ApiConstants.apiKeyParam +
        ApiConstants.apiKey +
        ApiConstants.languageParam +
        AppLocalizations.instance.locale.toString();
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
        page.toString() +
        ApiConstants.languageParam +
        AppLocalizations.instance.locale.toString();
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
        ApiConstants.apiKey +
        ApiConstants.languageParam +
        AppLocalizations.instance.locale.toString() +
        ApiConstants.appendVideoParam;
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      MovieDetail movieDetail = MovieDetail.fromJson(jsonDecode(response.body));
      movieDetail.movieImage = await getMovieImages(id);
      movieDetail.castList = await getCastList(id);
      return movieDetail;
    }
    return MovieDetail(
        posterPath: "",
        id: "",
        title: "",
        budget: "",
        originalTitle: "",
        overview: "",
        releaseDate: "",
        runtime: "",
        voteAverage: "",
        voteCount: "",
        genres: [],
        videoId: '');
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

  Future<List<Cast>> getCastList(int id) async {
    String url = ApiConstants.baseUrl +
        "/movie/" +
        id.toString() +
        "/credits" +
        ApiConstants.apiKeyParam +
        ApiConstants.apiKey +
        ApiConstants.languageParam +
        AppLocalizations.instance.locale.toString();
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      List<Cast> castList =
          (jsonDecode(response.body)["cast"] as List).map((cast) {
        return Cast.fromJson(cast);
      }).toList();
      return castList;
    }
    return [];
  }

  Future<List<Movie>> getMoviesByGenre(int genreId) async {
    List<Movie> movieList = [];

    for (int page = 1; page < 4; page++) {
      String url = ApiConstants.baseUrl +
          "/discover/movie" +
          ApiConstants.apiKeyParam +
          ApiConstants.apiKey +
          ApiConstants.apiPageParam +
          page.toString() +
          ApiConstants.languageParam +
          AppLocalizations.instance.locale.toString();
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        var movies = json["results"] as List;
        movieList.addAll(movies
            .map((movie) => Movie.fromJson(movie))
            .where((element) => element.genreIds?.contains(genreId) ?? false)
            .toList());
      }
    }
    return movieList;
  }

  Future<List<Genre>> getGenres() async {
    String url = ApiConstants.baseUrl +
        "/genre/movie/list" +
        ApiConstants.apiKeyParam +
        ApiConstants.apiKey +
        ApiConstants.languageParam +
        AppLocalizations.instance.locale.toString();
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      List<Genre> genreList =
          (jsonDecode(response.body)["genres"] as List).map((genre) {
        return Genre.fromJson(genre);
      }).toList();
      return genreList;
    }
    return [];
  }
}
