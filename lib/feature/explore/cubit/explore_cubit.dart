import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:movie_application/core/constants/api_constants.dart';
import 'package:movie_application/core/models/genre_model.dart';

import '../../../core/models/movie_model.dart';
import '../../../core/services/api_services.dart';

part 'explore_state.dart';

class ExploreCubit extends Cubit<ExploreState> {
  ExploreCubit() : super(ExploreInitial());
  int selectedGenre = 28;

  void changeGenre(int genre, ExploreLoaded state) async {
    selectedGenre = genre;
    final topRatedMovies = await ApiServices().getMoviesByGenre(genre);
    emit(ExploreLoading());
    emit(ExploreLoaded(
      topRatedMovies: topRatedMovies,
      upcomingMovies: state.upcomingMovies,
      genres: state.genres,
      selectedGenre: selectedGenre,
    ));
  }

  void seeAllUpcomingMovies() async {
    emit(ExploreLoading());
    try {
      final ScrollController scrollController = ScrollController();
      int page = 1;
      final upcomingMovieList = await ApiServices()
          .getMoviesFromApi(ApiConstants.upcomingMovies, page);
      scrollController.addListener(() async {
        if (scrollController.position.maxScrollExtent ==
            scrollController.offset) {
          page++;
          final newMovies = await ApiServices()
              .getMoviesFromApi(ApiConstants.popularMovies, page);
          if (newMovies.length > 1) {
            emit(ExploreLoading());
            upcomingMovieList.addAll(newMovies);
            emit(SeeAllUpcomingMovies(
              movies: upcomingMovieList,
              scrollController: scrollController,
            ));
          }
        }
      });

      emit(SeeAllUpcomingMovies(
        movies: upcomingMovieList,
        scrollController: scrollController,
      ));
    } catch (e) {
      emit(ExploreError());
    }
  }

  void loadExplore() async {
    emit(ExploreLoading());
    try {
      final genres = await ApiServices().getGenres();
      final upcomingMovies =
          await ApiServices().getMoviesFromApi(ApiConstants.upcomingMovies, 1);
      final topRatedMovies =
          await ApiServices().getMoviesFromApi(ApiConstants.topratedMovies, 1);
      emit(ExploreLoaded(
        selectedGenre: selectedGenre,
        genres: genres,
        upcomingMovies: upcomingMovies,
        topRatedMovies: topRatedMovies,
      ));
    } catch (e) {
      emit(ExploreInitial());
    }
  }
}
