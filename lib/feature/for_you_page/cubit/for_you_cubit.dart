import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:movie_application/core/models/movie_model.dart';
import 'package:movie_application/core/services/api_services.dart';

import '../../../core/constants/api_constants.dart';

part 'for_you_state.dart';

class ForYouCubit extends Cubit<ForYouState> {
  ForYouCubit() : super(ForYouInitial());

  void loadTopRatedMovies() async {
    emit(ForYouLoading());
    try {
      final ScrollController scrollController = ScrollController();
      int page = 1;
      final topRatedMovieList = await ApiServices().getMoviesFromApi(
          ApiConstants.topratedMovies, page, DateTime(0, 0, 0));
      scrollController.addListener(() async {
        if (scrollController.position.maxScrollExtent ==
            scrollController.offset) {
          page++;
          final newMovies = await ApiServices().getMoviesFromApi(
              ApiConstants.topratedMovies, page, DateTime(0, 0, 0));
          if (newMovies.length > 1) {
            emit(ForYouLoading());
            topRatedMovieList.addAll(newMovies);
            emit(ForYouLoaded(
              movies: topRatedMovieList,
              scrollController: scrollController,
            ));
          }
        }
      });

      emit(ForYouLoaded(
        movies: topRatedMovieList,
        scrollController: scrollController,
      ));
    } catch (e) {
      emit(ForYouError());
    }
  }
}
