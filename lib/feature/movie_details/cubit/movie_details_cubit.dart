import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_application/core/services/api_services.dart';

import '../../../core/models/movie_detail_model.dart';

part 'movie_details_state.dart';

class MovieDetailsCubit extends Cubit<MovieDetailsState> {
  MovieDetailsCubit() : super(MovieDetailsInitial());

  void loadMovieDetail(int id) async {
    final movieDetail = await ApiServices().getMovieDetails(id);
    emit(MovieDetailLoaded(movieDetail));
  }
}
