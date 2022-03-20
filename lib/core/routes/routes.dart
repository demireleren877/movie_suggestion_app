import 'package:flutter/material.dart';
import 'package:movie_application/core/init/init_screen.dart';
import 'package:movie_application/feature/home/home_screen.dart';

class Routes {
  Routes._();
  static const String home = '/';
  static const String init = '/init';
  static final routes = <String, WidgetBuilder>{
    home: (BuildContext context) => const HomeScreen(),
    init: (BuildContext context) => const InitScreen(),
  };
}
