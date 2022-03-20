import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';
import 'package:movie_application/core/models/popular_movie_model.dart';

import '../../../core/services/api_services.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  void getPopularMovies() async {
    emit(HomeLoading());
    try {
      final popularMovies = await getPopularMoviesFromApi();
      emit(HomeLoaded(movies: popularMovies));
    } catch (e) {
      emit(HomeError());
    }
  }
}
