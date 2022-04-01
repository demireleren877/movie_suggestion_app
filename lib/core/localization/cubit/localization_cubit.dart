import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';

part 'localization_state.dart';

class LocalizationCubit extends Cubit<LocalizationState> {
  LocalizationCubit()
      : super(SelectedLocale(Locale(Hive.box('locale').get('locale') ?? 'en')));

  void toEnglish() {
    Hive.box('locale').put('locale', 'en');
    emit(const SelectedLocale(Locale('en')));
  }

  void toTurkish() {
    Hive.box('locale').put('locale', 'tr');
    emit(const SelectedLocale(Locale('tr')));
  }
}
