import 'dart:ui';

import 'package:bloc/bloc.dart';

part 'localization_state.dart';

class LocalizationCubit extends Cubit<LocalizationState> {
  LocalizationCubit() : super(const SelectedLocale(Locale('tr')));

  void toEnglish() {
    emit(const SelectedLocale(Locale('en')));
  }

  void toTurkish() {
    emit(const SelectedLocale(Locale('tr')));
  }
}
