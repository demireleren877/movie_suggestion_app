import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_application/core/services/api_services.dart';

import '../../../core/models/movie_model.dart';

part 'all_movies_state.dart';

class AllMoviesCubit extends Cubit<AllMoviesState> {
  AllMoviesCubit() : super(AllMoviesChangeButton());

  bool isSearching = false;

  void onSearchPressed() {
    emit(AllMoviesInitial());
    isSearching = !isSearching;
    emit(AllMoviesChangeButton());
  }

  void onSearchChanged(String query) async {
    final searchResults = await ApiServices().searchedMovies(query);
    emit(AllMoviesLoaded(query: query, movies: searchResults));
  }
}
