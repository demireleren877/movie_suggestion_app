import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_application/core/routes/routes.dart';
import 'package:movie_application/core/theme/theme_data.dart';
import 'package:movie_application/core/translations/codegen_loader.g.dart';
import 'package:movie_application/feature/explore/cubit/explore_cubit.dart';
import 'package:movie_application/feature/home/cubit/home_cubit.dart';

import 'feature/movie_tinder/cubit/movie_tinder_cubit.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky,
      overlays: [SystemUiOverlay.top]);
  runApp(
    EasyLocalization(
      path: "assets/translations",
      assetLoader: const CodegenLoader(),
      supportedLocales: const [
        Locale('en'),
        Locale('tr'),
      ],
      saveLocale: true,
      fallbackLocale: const Locale('en'),
      child: const MyApp(),
    ),
  );
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
        ],
        child: MaterialApp(
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          themeMode: ThemeMode.dark,
          debugShowCheckedModeBanner: false,
          darkTheme: AppThemeData.themeData,
          title: 'Material App',
          initialRoute: Routes.init,
          routes: Routes.routes,
        ),
      ),
    );
  }
}
