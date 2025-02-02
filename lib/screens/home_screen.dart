import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex_app/cubit/launch_cubit.dart';
// import 'package:spacex_app/routes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<LaunchCubit>().fetchAllLaunches();
    return Scaffold(
      appBar: AppBar(title: const Text("All Launches")),
      body: BlocBuilder<LaunchCubit, LaunchState>(
        builder: (context, state) {
          if (state is LaunchLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is LaunchLoaded) {
            return ListView.builder(
              itemCount: state.launches.length,
              itemBuilder: (context, index) {
                final launch = state.launches[index];
                return ListTile(
                  title: Text(launch.name),
                  subtitle: Column(
                    children: [
                      Text(launch.id),
                      Text(launch.date.toString()),
                      Text(launch.success.toString()),
                      Text(launch.details),
                    ],
                  ),
                );
              },
            );
          } else if (state is LaunchError) {
            return Center(child: Text(state.message));
          }
          return Container();
        },
      ),
    );
  }
}
