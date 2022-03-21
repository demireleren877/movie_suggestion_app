import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_application/core/components/centered_progress.dart';
import 'package:movie_application/feature/home/cubit/home_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is HomeInitial) {
          return const CenteredProgressIndicator();
        } else if (state is HomeLoading) {
          return const CenteredProgressIndicator();
        } else if (state is HomeLoaded) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Home'),
            ),
            body: ListView.builder(
              itemCount: state.movies?.length ?? 0,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: ListTile(
                    title: Text(state.movies?[index].title ?? ''),
                  ),
                );
              },
            ),
          );
        } else {
          return const Text("Error");
        }
      },
    );
  }
}
