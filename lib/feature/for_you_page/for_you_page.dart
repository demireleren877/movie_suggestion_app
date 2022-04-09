import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_application/feature/for_you_page/cubit/for_you_cubit.dart';

import '../../core/components/centered_progress.dart';
import '../movies_gridview/all_movies_gridview.dart';

class ForYouPage extends StatelessWidget {
  const ForYouPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ForYouCubit, ForYouState>(
      builder: (context, state) {
        return BlocBuilder<ForYouCubit, ForYouState>(
          builder: (context, state) {
            if (state is ForYouInitial) {
              return const CenteredProgressIndicator();
            } else if (state is ForYouLoading) {
              return const CenteredProgressIndicator();
            } else if (state is ForYouLoaded) {
              return MoviesGridview(
                movies: state.movies,
                isVisible: false,
                title: "Top Rated Movies",
                onBackPressed: () {},
                scrollController: state.scrollController,
              );
            } else {
              return const CenteredProgressIndicator();
            }
          },
        );
      },
    );
  }
}
