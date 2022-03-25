import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kartal/kartal.dart';
import 'package:movie_application/core/components/centered_progress.dart';
import 'package:movie_application/core/constants/api_constants.dart';
import 'package:movie_application/core/services/api_services.dart';

import 'cubit/movie_tinder_cubit.dart';

class MovieTinderScreen extends StatelessWidget {
  const MovieTinderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieTinderCubit, MovieTinderState>(
      builder: (context, state) {
        if (state is MovieTinderInitial) {
          return const CenteredProgressIndicator();
        } else if (state is MovieTinderLoading) {
          return const CenteredProgressIndicator();
        } else if (state is MovieTinderLoaded) {
          return Scaffold(
            body: Padding(
              padding: context.paddingNormal,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: context.height * 0.8,
                    child: Stack(
                      children: state.movies,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 60.h,
                        width: 60.w,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.blueGrey[800],
                        ),
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.clear,
                            color: Colors.red,
                            size: 35,
                          ),
                        ),
                      ),
                      Container(
                        height: 60.h,
                        width: 60.w,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.blueGrey[800],
                        ),
                        child: IconButton(
                          onPressed: () {
                            ApiServices()
                                .getMoviesFromApi(ApiConstants.playingMovies);
                          },
                          icon: const Icon(
                            Icons.star_rounded,
                            color: Colors.yellow,
                            size: 35,
                          ),
                        ),
                      ),
                      Container(
                        height: 60.h,
                        width: 60.w,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.blueGrey[800],
                        ),
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.favorite,
                            color: Colors.green,
                            size: 35,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        } else {
          return const Text("Error");
        }
      },
    );
  }
}
