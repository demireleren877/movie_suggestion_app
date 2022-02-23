import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swipable/flutter_swipable.dart';
import 'package:movie_application/core/constants/app_constants.dart';
import 'package:movie_application/core/locator/locator.dart';
import 'package:movie_application/feature/home/viewmodel/home_viewmodel.dart';
import 'package:kartal/kartal.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeViewModel _homeViewModel = locator<HomeViewModel>();
  List<ImageCard> images = [];

  @override
  void initState() {
    _homeViewModel.getPopularMovies();
    for (int i = 0; i < _homeViewModel.images.length; i++) {
      images.add(ImageCard(homeViewModel: _homeViewModel, i: i));
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: context.height,
        child: Center(
          child: Stack(
            children: images,
          ),
        ),
      ),
    );
  }
}

class ImageCard extends StatelessWidget {
  const ImageCard({Key? key, required this.homeViewModel, required this.i})
      : super(key: key);
  final HomeViewModel homeViewModel;
  final int i;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.height * 0.8,
      padding: context.paddingLow,
      child: Swipable(
        onSwipeLeft: (context) => print('left'),
        verticalSwipe: false,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15.r),
          child: Image.network(
            AppConstants.imageurl + homeViewModel.images[i],
          ),
        ),
      ),
    );
  }
}
