import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';

import '../../../core/services/api_services.dart';
import '../components/image_card.dart';

part 'movie_tinder_state.dart';

class MovieTinderCubit extends Cubit<MovieTinderState> {
  MovieTinderCubit() : super(MovieTinderInitial());

  void getPopularMovies() async {
    emit(MovieTinderLoading());
    try {
      final popularMovies = await ApiServices().getMovieTinderFromApi();
      emit(MovieTinderLoaded(movies: popularMovies));
    } catch (e) {
      emit(MovieTinderError());
    }
  }
}
