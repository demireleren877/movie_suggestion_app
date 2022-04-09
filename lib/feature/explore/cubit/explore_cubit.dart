import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:movie_application/core/constants/api_constants.dart';
import 'package:movie_application/core/localization/app_localizations.dart';
import 'package:movie_application/core/models/genre_model.dart';

import '../../../core/models/movie_model.dart';
import '../../../core/services/api_services.dart';

part 'explore_state.dart';

class ExploreCubit extends Cubit<ExploreState> {
  ExploreCubit() : super(ExploreInitial());
  int selectedGenre = 28;

  void changeGenre(int genre, ExploreLoaded state) async {
    selectedGenre = genre;
    final discoverMovies = await ApiServices().getMoviesByGenre(genre);
    emit(ExploreLoading());
    emit(ExploreLoaded(
      discoverMovies: discoverMovies,
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
              .getMoviesFromApi(ApiConstants.upcomingMovies, page);
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

  void discoverMovies() async {
    emit(ExploreLoading());
    try {
      final ScrollController scrollController = ScrollController();
      int page = 1;
      final movies = await ApiServices()
          .getMoviesFromApi(ApiConstants.discoverParam, page);
      scrollController.addListener(() async {
        if (scrollController.position.maxScrollExtent ==
            scrollController.offset) {
          page++;
          final newMovies = await ApiServices()
              .getMoviesFromApi(ApiConstants.discoverParam, page);
          if (newMovies.length > 1) {
            emit(ExploreLoading());
            movies.addAll(newMovies);
            emit(DiscoverNewMovies(
              movies: movies,
              scrollController: scrollController,
            ));
          }
        }
      });

      emit(DiscoverNewMovies(
        movies: movies,
        scrollController: scrollController,
      ));
    } catch (e) {
      emit(ExploreError());
    }
  }

  void loadExplore() async {
    emit(ExploreLoading());
    try {
      List<Genre> genres = [];
      genres.add(Genre(
          id: 000,
          name: AppLocalizations.instance.translate("discover") ?? ""));
      genres.addAll(await ApiServices().getGenres());

      final upcomingMovies =
          await ApiServices().getMoviesFromApi(ApiConstants.upcomingMovies, 1);
      final discoverMovies =
          await ApiServices().getMoviesByGenre(selectedGenre);
      emit(ExploreLoaded(
        selectedGenre: selectedGenre,
        genres: genres,
        upcomingMovies: upcomingMovies,
        discoverMovies: discoverMovies,
      ));
    } catch (e) {
      emit(ExploreInitial());
    }
  }
}
