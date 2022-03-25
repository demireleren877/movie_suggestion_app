import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_application/core/constants/api_constants.dart';

import '../../../core/services/api_services.dart';
import '../playing_movies/components/slide_card.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  void getPlayingMovies() async {
    emit(HomeLoading());
    try {
      final playingMovieList =
          await ApiServices().getMoviesFromApi(ApiConstants.playingMovies);
      List<SlideCard>? playingMovies = [];
      for (int i = 0; i < playingMovieList.length; i++) {
        playingMovies.add(
          SlideCard(
            image: playingMovieList[i].backdropPath,
            title: playingMovieList[i].title,
            voteAverage: playingMovieList[i].voteAverage,
          ),
        );
      }
      emit(HomeLoaded(playingMovies: playingMovies));
    } catch (e) {
      emit(HomeError());
    }
  }
}
