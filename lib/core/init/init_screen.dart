import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:movie_application/core/localization/app_localizations.dart';
import 'package:movie_application/core/routes/routes.dart';

class InitScreen extends StatefulWidget {
  const InitScreen({Key? key}) : super(key: key);

  @override
  State<InitScreen> createState() => _InitScreenState();
}

class _InitScreenState extends State<InitScreen> {
  late Box box;
  @override
  void initState() {
    box = Hive.box('locale');
    box.put('locale', AppLocalizations.instance.locale.languageCode);
    print(box.get('locale'));
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushNamedAndRemoveUntil(context, Routes.home, (route) => false);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.asset('assets/animations/splash_anim.json'),
      ),
    );
  }
}
