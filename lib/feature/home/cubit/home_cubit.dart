import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_application/core/constants/api_constants.dart';

import '../../../core/models/popular_movie_model.dart';
import '../../../core/services/api_services.dart';
import '../playing_movies/components/slide_card.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  void getAllMovies() async {
    emit(HomeLoading());
    try {
      final playingMovieList =
          await ApiServices().getMoviesFromApi(ApiConstants.playingMovies);
      final popularMovieList =
          await ApiServices().getMoviesFromApi(ApiConstants.popularMovies);

      emit(HomeLoaded(
          playingMovies: getSliderCards(playingMovieList),
          popularMovies: popularMovieList));
    } catch (e) {
      emit(HomeError());
    }
  }

  List<SlideCard> getSliderCards(List<Movie> movies) {
    List<SlideCard> slideCards = [];
    for (int i = 0; i < movies.length; i++) {
      slideCards.add(
        SlideCard(
          image: movies[i].backdropPath,
          title: movies[i].title,
          voteAverage: movies[i].voteAverage,
        ),
      );
    }
    return slideCards;
  }
}
