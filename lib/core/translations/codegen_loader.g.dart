// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>> load(String fullPath, Locale locale ) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> en = {
  "playing_movie_title": "Playing Movies",
  "popular_movie_title": "Popular Movies",
  "upcoming_movie_title": "Upcoming Movies",
  "cast_list_title": "Cast"
};
static const Map<String,dynamic> tr = {
  "playing_movie_title": "Yayındaki Filmler",
  "popular_movie_title": "Popüler Filmler",
  "upcoming_movie_title": "Gelecek Filmler",
  "cast_list_title": "Oyuncular"
};
static const Map<String, Map<String,dynamic>> mapLocales = {"en": en, "tr": tr};
}
