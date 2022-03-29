import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:movie_application/core/constants/api_constants.dart';

import '../../../core/models/movie_model.dart';
import '../../../core/services/api_services.dart';
import '../playing_movies/components/slide_card.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  void getAllMovies() async {
    emit(HomeLoading());
    try {
      final playingMovieList =
          await ApiServices().getMoviesFromApi(ApiConstants.playingMovies, 1);
      final popularMovieList =
          await ApiServices().getMoviesFromApi(ApiConstants.popularMovies, 1);

      emit(HomeLoaded(
          playingMovies: getSliderCards(playingMovieList),
          popularMovies: popularMovieList));
    } catch (e) {
      emit(HomeError());
    }
  }

  void seeAllPopularMovies() async {
    emit(HomeLoading());
    try {
      final ScrollController scrollController = ScrollController();
      int page = 1;
      final popularMovieList = await ApiServices()
          .getMoviesFromApi(ApiConstants.popularMovies, page);
      scrollController.addListener(() async {
        if (scrollController.position.maxScrollExtent ==
            scrollController.offset) {
          page++;
          final newMovies = await ApiServices()
              .getMoviesFromApi(ApiConstants.popularMovies, page);
          if (newMovies.length > 1) {
            emit(HomeLoading());
            popularMovieList.addAll(newMovies);
            emit(SeeAllPopularMovies(
                popularMovies: popularMovieList,
                scrollController: scrollController));
          }
        }
      });

      emit(SeeAllPopularMovies(
        popularMovies: popularMovieList,
        scrollController: scrollController,
      ));
    } catch (e) {
      emit(HomeError());
    }
  }

  void seeAllPlayingMovies() async {
    emit(HomeLoading());
    try {
      final ScrollController scrollController = ScrollController();
      int page = 1;
      final playingMovieList = await ApiServices()
          .getMoviesFromApi(ApiConstants.playingMovies, page);
      scrollController.addListener(() async {
        if (scrollController.position.maxScrollExtent ==
            scrollController.offset) {
          page++;
          final newMovies = await ApiServices()
              .getMoviesFromApi(ApiConstants.playingMovies, page);
          if (newMovies.length > 1) {
            emit(HomeLoading());
            playingMovieList.addAll(newMovies);
            emit(SeeAllPlayingMovies(
                playingMovies: playingMovieList,
                scrollController: scrollController));
          }
        }
      });

      emit(SeeAllPlayingMovies(
        playingMovies: playingMovieList,
        scrollController: scrollController,
      ));
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
