import 'dart:convert';

import 'package:mobx/mobx.dart';
import 'package:http/http.dart' as http;
import '../../constants/app_constants.dart';
import '../../models/popular_movie_model.dart';
part 'init_viewmodel.g.dart';

class InitViewModel = _InitViewModelBase with _$InitViewModel;

abstract class _InitViewModelBase with Store {
  @observable
  PopularMovies? popularMovieResponse;

  @action
  getPopularMovies() async {
    var response = await http.get(Uri.parse(AppConstants.baseUrl +
        AppConstants.popularMovies +
        AppConstants.apiParam +
        AppConstants.apiKey));
    if (response.statusCode == 200) {
      popularMovieResponse = PopularMovies.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to load");
    }
  }
}
