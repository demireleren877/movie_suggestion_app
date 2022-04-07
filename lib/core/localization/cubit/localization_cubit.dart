import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:movie_application/core/constants/hive_constants.dart';

part 'localization_state.dart';

class LocalizationCubit extends Cubit<LocalizationState> {
  LocalizationCubit()
      : super(SelectedLocale(
            Locale(Hive.box(HiveConstants.locale).get('locale') ?? 'en')));

  void toEnglish() {
    Hive.box(HiveConstants.locale).put(HiveConstants.locale, 'en');
    emit(const SelectedLocale(Locale('en')));
  }

  void toTurkish() {
    Hive.box(HiveConstants.locale).put(HiveConstants.locale, 'tr');
    emit(const SelectedLocale(Locale('tr')));
  }
}
