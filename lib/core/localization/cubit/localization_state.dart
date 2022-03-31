part of 'localization_cubit.dart';

abstract class LocalizationState {
  const LocalizationState(this.locale);
  final Locale locale;
}

class SelectedLocale extends LocalizationState {
  const SelectedLocale(Locale locale) : super(locale);
}
