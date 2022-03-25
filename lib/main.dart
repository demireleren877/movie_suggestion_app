import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_application/core/routes/routes.dart';

import 'feature/movie_tinder/cubit/movie_tinder_cubit.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
      builder: () => BlocProvider(
        create: (context) => MovieTinderCubit()..getPopularMovies(),
        child: MaterialApp(
          themeMode: ThemeMode.dark,
          debugShowCheckedModeBanner: false,
          theme: FlexThemeData.light(
            colors: const FlexSchemeColor(
              primary: Color(0xff223a5e),
              primaryVariant: Color(0xff1b2e4b),
              secondary: Color(0xff144955),
              secondaryVariant: Color(0xff208399),
              appBarColor: Color(0xff208399),
              error: Color(0xffb00020),
            ),
            surfaceMode: FlexSurfaceMode.highScaffoldLowSurface,
            blendLevel: 18,
            appBarStyle: FlexAppBarStyle.primary,
            appBarOpacity: 0.95,
            appBarElevation: 0,
            transparentStatusBar: true,
            tabBarStyle: FlexTabBarStyle.forAppBar,
            tooltipsMatchBackground: true,
            swapColors: false,
            lightIsWhite: false,
            useSubThemes: true,
            visualDensity: FlexColorScheme.comfortablePlatformDensity,
            // To use playground font, add GoogleFonts package and uncomment:
            // fontFamily: GoogleFonts.notoSans().fontFamily,
            subThemesData: const FlexSubThemesData(
              useTextTheme: true,
              fabUseShape: true,
              interactionEffects: true,
              bottomNavigationBarElevation: 0,
              bottomNavigationBarOpacity: 0.95,
              navigationBarOpacity: 0.95,
              navigationBarMutedUnselectedText: true,
              navigationBarMutedUnselectedIcon: true,
              inputDecoratorIsFilled: true,
              inputDecoratorBorderType: FlexInputBorderType.outline,
              inputDecoratorUnfocusedHasBorder: true,
              blendOnColors: true,
              blendTextTheme: true,
              popupMenuOpacity: 0.95,
            ),
          ),
          darkTheme: FlexThemeData.dark(
            colors: const FlexSchemeColor(
              primary: Color(0xff748bac),
              primaryVariant: Color(0xff7fa1d0),
              secondary: Color(0xff539eaf),
              secondaryVariant: Color(0xff219ab5),
              appBarColor: Color(0xff219ab5),
              error: Color(0xffcf6679),
            ),
            surfaceMode: FlexSurfaceMode.highScaffoldLowSurface,
            blendLevel: 18,
            appBarStyle: FlexAppBarStyle.background,
            appBarOpacity: 0.95,
            appBarElevation: 0,
            transparentStatusBar: true,
            tabBarStyle: FlexTabBarStyle.forAppBar,
            tooltipsMatchBackground: true,
            swapColors: false,
            darkIsTrueBlack: false,
            useSubThemes: true,
            visualDensity: FlexColorScheme.comfortablePlatformDensity,
            // To use playground font, add GoogleFonts package and uncomment:
            // fontFamily: GoogleFonts.notoSans().fontFamily,
            subThemesData: const FlexSubThemesData(
              useTextTheme: true,
              fabUseShape: true,
              interactionEffects: true,
              bottomNavigationBarElevation: 0,
              bottomNavigationBarOpacity: 0.95,
              navigationBarOpacity: 0.95,
              navigationBarMutedUnselectedText: true,
              navigationBarMutedUnselectedIcon: true,
              inputDecoratorIsFilled: true,
              inputDecoratorBorderType: FlexInputBorderType.outline,
              inputDecoratorUnfocusedHasBorder: true,
              blendOnColors: true,
              blendTextTheme: true,
              popupMenuOpacity: 0.95,
            ),
          ),
          title: 'Material App',
          initialRoute: Routes.init,
          routes: Routes.routes,
        ),
      ),
    );
  }
}
