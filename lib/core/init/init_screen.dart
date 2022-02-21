import 'package:flutter/material.dart';
import 'package:movie_application/core/init/viewmodel/init_viewmodel.dart';

class InitScreen extends StatefulWidget {
  const InitScreen({Key? key}) : super(key: key);

  @override
  State<InitScreen> createState() => _InitScreenState();
}

class _InitScreenState extends State<InitScreen> {
  final InitViewModel _initViewModel = InitViewModel();

  @override
  void initState() {
    _initViewModel.getPopularMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
