import 'package:flutter/material.dart';
import 'package:movie_application/core/init/init_screen.dart';
import 'package:movie_application/feature/movie_details/detail_screen.dart';
import 'package:movie_application/feature/tabview/tab_screen.dart';

class Routes {
  Routes._();
  static const String init = '/init';
  static const String home = '/home';
  static const String movieDetail = '/movieDetail';
  static final routes = <String, WidgetBuilder>{
    init: (BuildContext context) => const InitScreen(),
    home: (BuildContext context) => TabViewScreen(),
    movieDetail: (BuildContext context) => const DetailScreen(movieId: 505468),
  };
}
