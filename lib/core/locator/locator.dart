import 'package:get_it/get_it.dart';

import '../../feature/home/viewmodel/home_viewmodel.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => HomeViewModel());
}
