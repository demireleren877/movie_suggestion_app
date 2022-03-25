import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../cubit/home_cubit.dart';

class PlayingMoviesSlider extends StatelessWidget {
  const PlayingMoviesSlider({
    Key? key,
    required this.state,
  }) : super(key: key);

  final HomeLoaded state;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: state.playingMovies,
      options: CarouselOptions(
        autoPlay: true,
        enlargeCenterPage: true,
        viewportFraction: 1,
        enableInfiniteScroll: true,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
