import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';
import 'package:movie_application/core/components/centered_progress.dart';
import 'package:movie_application/feature/movie_details/cubit/movie_details_cubit.dart';

import '../../core/constants/api_constants.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key, required this.movieId}) : super(key: key);
  final int movieId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MovieDetailsCubit()..loadMovieDetail(movieId),
      child: BlocBuilder<MovieDetailsCubit, MovieDetailsState>(
        builder: (context, state) {
          if (state is MovieDetailsInitial) {
            return const CenteredProgressIndicator();
          } else if (state is MovieDetailLoading) {
            return const CenteredProgressIndicator();
          } else if (state is MovieDetailLoaded) {
            return Scaffold(
              body: Center(
                child: ListView(
                  children: [
                    Stack(
                      children: [
                        ClipRRect(
                          borderRadius: context.lowBorderRadius,
                          child: Image.network(
                            ApiConstants.imageurl + state.detail.posterPath,
                            height: context.height * 0.5,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Container(
                          height: context.height * 0.5,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              colors: [
                                const Color(0xFF252a31).withOpacity(1),
                                const Color(0xFF252a31).withOpacity(0.0),
                                const Color(0xFF252a31).withOpacity(0.3),
                                const Color(0xFF252a31).withOpacity(0.15),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          left: 10.w,
                          bottom: 20.h,
                          child: SizedBox(
                            width: context.width * 0.7,
                            child: Text(
                              state.detail.title +
                                  "  " +
                                  '(${state.detail.releaseDate.split('-')[0]})',
                              style: context.textTheme.headline4?.copyWith(
                                color: Colors.white,
                                fontFamily:
                                    GoogleFonts.josefinSans().fontFamily,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30.h,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: state.detail.genres.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.white),
                              borderRadius: context.lowBorderRadius,
                            ),
                            margin: context.horizontalPaddingLow,
                            padding: context.horizontalPaddingLow,
                            child: Center(
                              child: Text(
                                state.detail.genres[index]['name'],
                                style: const TextStyle(fontSize: 16),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: context.paddingNormal,
                      child: const Divider(
                        thickness: 1,
                      ),
                    ),
                    Padding(
                      padding: context.horizontalPaddingNormal,
                      child:
                          Text("Overview", style: context.textTheme.headline5),
                    ),
                    Padding(
                      padding: context.paddingNormal,
                      child: Text(
                        state.detail.overview,
                        style: context.textTheme.bodyText1?.copyWith(
                            fontSize: 20.sp,
                            fontFamily: GoogleFonts.quicksand().fontFamily),
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else {
            return const Scaffold(
              body: Center(
                child: Text("Error"),
              ),
            );
          }
        },
      ),
    );
  }
}
