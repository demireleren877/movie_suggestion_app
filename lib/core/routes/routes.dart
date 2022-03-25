import 'package:flutter/material.dart';
import 'package:movie_application/core/init/init_screen.dart';

import '../../feature/home/home_screen.dart';
import '../../feature/movie_tinder/movie_tinder_screen.dart';

class Routes {
  Routes._();
  static const String movieTinder = '/';
  static const String init = '/init';
  static const String home = '/home';
  static final routes = <String, WidgetBuilder>{
    movieTinder: (BuildContext context) => const MovieTinderScreen(),
    init: (BuildContext context) => const InitScreen(),
    home: (BuildContext context) => HomeScreen(),
  };
}
