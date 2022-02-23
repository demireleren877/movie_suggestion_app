import 'dart:convert';

import 'package:mobx/mobx.dart';
import 'package:http/http.dart' as http;
import '../../../core/constants/app_constants.dart';
import '../../../core/models/popular_movie_model.dart';
part 'home_viewmodel.g.dart';

class HomeViewModel = _HomeViewModelBase with _$HomeViewModel;

abstract class _HomeViewModelBase with Store {
  @observable
  PopularMovies? popularMovieResponse;

  @observable
  List<String> images = ObservableList.of([]);

  @action
  getPopularMovies() async {
    var response = await http.get(Uri.parse(AppConstants.baseUrl +
        AppConstants.popularMovies +
        AppConstants.apiParam +
        AppConstants.apiKey));
    if (response.statusCode == 200) {
      popularMovieResponse = PopularMovies.fromJson(jsonDecode(response.body));
      for (int i = 0; i < popularMovieResponse!.results.length; i++) {
        images.add(popularMovieResponse!.results[i].posterPath);
      }
    } else {
      throw Exception("Failed to load");
    }
  }
}
