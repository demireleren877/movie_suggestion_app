import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';
import '../../../core/constants/api_constants.dart';
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
              itemCount: state.popularMovies.length,
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: context.width * 0.5,
                crossAxisSpacing: 15.w,
                childAspectRatio: 0.59,
                mainAxisSpacing: 15.h,
              ),
              itemBuilder: (context, index) {
                return Container(
                  margin: context.horizontalPaddingLow,
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: context.lowBorderRadius,
                        child: Image.network(
                          ApiConstants.imageurl +
                              state.popularMovies[index].posterPath,
                          fit: BoxFit.contain,
                        ),
                      ),
                      context.emptySizedHeightBoxLow,
                      Container(
                        alignment: Alignment.center,
                        width: 150.w,
                        child: Text(
                          state.popularMovies[index].title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: context.textTheme.bodyLarge?.copyWith(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                            fontFamily: GoogleFonts.josefinSans().fontFamily,
                          ),
                        ),
                      ),
                      context.emptySizedHeightBoxLow,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Text(
                                state.popularMovies[index].voteAverage
                                    .toString(),
                                style: context.textTheme.bodyLarge?.copyWith(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.bold,
                                  fontFamily:
                                      GoogleFonts.josefinSans().fontFamily,
                                ),
                              ),
                              Icon(
                                Icons.star,
                                size: 18.w,
                                color: Colors.yellow,
                              ),
                            ],
                          ),
                          context.emptySizedWidthBoxNormal,
                          Text(emoji(
                              state.popularMovies[index].originalLanguage))
                        ],
                      ),
                      context.emptySizedHeightBoxLow,
                    ],
                  ),
                );
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
