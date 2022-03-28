import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kartal/kartal.dart';
import 'package:movie_application/feature/home/popular_movies/components/movie_card.dart';
import 'package:movie_application/feature/home/popular_movies/components/shimmer_widget.dart';
import '../cubit/home_cubit.dart';

class PopularMoviesScreen extends StatelessWidget {
  const PopularMoviesScreen({Key? key, required this.state}) : super(key: key);

  final SeeAllPopularMovies state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: context.read<HomeCubit>().getAllMovies,
        ),
        centerTitle: true,
        title: const Text('All Popular Movies'),
      ),
      body: Column(
        children: [
          context.emptySizedHeightBoxLow3x,
          Flexible(
            child: GridView.builder(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              controller: state.scrollController,
              itemCount: state.popularMovies.length + 2,
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: context.width * 0.5,
                crossAxisSpacing: 15.w,
                childAspectRatio: 0.59,
                mainAxisSpacing: 15.h,
              ),
              itemBuilder: (context, index) {
                if (index == state.popularMovies.length ||
                    index == state.popularMovies.length + 1) {
                  return const ShimmerWidget();
                }
                return MovieCard(
                    popularMovies: state.popularMovies, index: index);
              },
            ),
          ),
        ],
      ),
    );
  }

  emoji(String code) {
    int flagOffset = 0x1F1E6;
    int asciiOffset = 0x41;
    String country = code == "en"
        ? "US"
        : code == "ja"
            ? "JPN"
            : code.toUpperCase();
    int firstChar = country.codeUnitAt(0) - asciiOffset + flagOffset;
    int secondChar = country.codeUnitAt(1) - asciiOffset + flagOffset;
    String emoji =
        String.fromCharCode(firstChar) + String.fromCharCode(secondChar);
    return emoji;
  }
}
