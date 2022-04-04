import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:movie_application/core/constants/hive_constants.dart';
import 'package:movie_application/core/localization/app_localizations_setup.dart';
import 'package:movie_application/core/localization/cubit/localization_cubit.dart';
import 'package:movie_application/feature/explore/cubit/explore_cubit.dart';
import 'package:movie_application/feature/home/cubit/home_cubit.dart';
import 'package:movie_application/feature/movies_gridview/cubit/all_movies_cubit.dart';
import 'core/models/movie_model.dart';
import 'core/routes/routes.dart';
import 'core/theme/theme_data.dart';
import 'feature/movie_tinder/cubit/movie_tinder_cubit.dart';

late Box box;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(MovieAdapter());
  await Hive.openBox(HiveConstants.locale);
  await Hive.openBox(HiveConstants.hiveMovieList);
  await Hive.openBox(HiveConstants.hiveSeriesList);
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky,
      overlays: [SystemUiOverlay.top]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(412, 798),
      builder: () => MultiBlocProvider(
        providers: [
          BlocProvider<HomeCubit>(
            create: (context) => HomeCubit()..getAllMovies(),
          ),
          BlocProvider(
            create: (context) => MovieTinderCubit()..getPopularMovies(),
          ),
          BlocProvider(
            create: (context) => ExploreCubit()..loadExplore(),
          ),
          BlocProvider(
            create: (context) => LocalizationCubit(),
          ),
          BlocProvider(
            create: (context) => AllMoviesCubit(),
          ),
        ],
        child: BlocBuilder<LocalizationCubit, LocalizationState>(
          buildWhen: (previous, current) => previous != current,
          builder: (context, state) {
            return MaterialApp(
              locale: state.locale,
              supportedLocales: AppLocalizationsSetup.supportedLocales,
              localizationsDelegates:
                  AppLocalizationsSetup.localizationsDelegates,
              themeMode: ThemeMode.dark,
              debugShowCheckedModeBanner: false,
              darkTheme: AppThemeData.themeData,
              title: 'Material App',
              initialRoute: Routes.init,
              routes: Routes.routes,
            );
          },
        ),
      ),
    );
  }
}
