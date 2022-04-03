import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kartal/kartal.dart';
import 'package:movie_application/core/models/movie_model.dart';

import 'movie_card.dart';
import '../../feature/home/popular_movies/components/shimmer_widget.dart';

class MoviesGridview extends StatefulWidget {
  const MoviesGridview({
    Key? key,
    required this.title,
    required this.scrollController,
    required this.movies,
    required this.onBackPressed,
  }) : super(key: key);
  final String title;
  final ScrollController scrollController;
  final List<Movie> movies;
  final VoidCallback onBackPressed;

  @override
  State<MoviesGridview> createState() => _MoviesGridviewState();
}

class _MoviesGridviewState extends State<MoviesGridview> {
  bool isSearchMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: BackButton(
          onPressed: widget.onBackPressed,
        ),
        toolbarHeight: 70.h,
        centerTitle: true,
        title: AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          transitionBuilder: (Widget child, Animation<double> animation) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
          child: isSearchMode
              ? SizedBox(
                  height: 45.h,
                  child: TextField(
                    decoration: InputDecoration(
                      floatingLabelAlignment: FloatingLabelAlignment.center,
                      contentPadding: context.horizontalPaddingNormal,
                      hintText: 'Search any movie...',
                      border: InputBorder.none,
                    ),
                  ),
                )
              : Text(widget.title),
        ),
        actions: [
          IconButton(
            icon: isSearchMode
                ? const Icon(Icons.clear)
                : const Icon(Icons.search),
            onPressed: () {
              setState(() {
                isSearchMode = !isSearchMode;
              });
            },
          ),
        ],
      ),
      body: Column(
        children: [
          context.emptySizedHeightBoxLow3x,
          Flexible(
            child: GridView.builder(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              controller: widget.scrollController,
              itemCount: widget.movies.length + 2,
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: context.width * 0.5,
                crossAxisSpacing: 15.w,
                childAspectRatio: 0.59,
                mainAxisSpacing: 15.h,
              ),
              itemBuilder: (context, index) {
                if (index == widget.movies.length ||
                    index == widget.movies.length + 1) {
                  return const ShimmerWidget();
                }
                return MovieCard(
                  movies: widget.movies,
                  index: index,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
