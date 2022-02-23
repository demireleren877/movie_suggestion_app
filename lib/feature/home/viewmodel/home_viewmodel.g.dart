// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeViewModel on _HomeViewModelBase, Store {
  final _$popularMovieResponseAtom =
      Atom(name: '_HomeViewModelBase.popularMovieResponse');

  @override
  PopularMovies? get popularMovieResponse {
    _$popularMovieResponseAtom.reportRead();
    return super.popularMovieResponse;
  }

  @override
  set popularMovieResponse(PopularMovies? value) {
    _$popularMovieResponseAtom.reportWrite(value, super.popularMovieResponse,
        () {
      super.popularMovieResponse = value;
    });
  }

  final _$getPopularMoviesAsyncAction =
      AsyncAction('_HomeViewModelBase.getPopularMovies');

  @override
  Future getPopularMovies() {
    return _$getPopularMoviesAsyncAction.run(() => super.getPopularMovies());
  }

  @override
  String toString() {
    return '''
popularMovieResponse: ${popularMovieResponse}
    ''';
  }
}
