import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex_app/cubit/launch_cubit.dart';
import 'package:spacex_app/widgets/loaded_lounches.dart';
import 'package:spacex_app/widgets/loading_widget.dart';
import 'package:spacex_app/widgets/my_app_bar.dart';
import 'package:spacex_app/widgets/my_drawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      drawer: MyDrawer(),
      body: BlocBuilder<LaunchCubit, LaunchState>(
        builder: (context, state) {
          if (state is LaunchLoading) {
            return LoadingWidget();
          } else if (state is LaunchLoaded) {
            return RefreshIndicator(
              onRefresh: () async {
                context.read<LaunchCubit>().fetchAllLaunches();
              },
              child: ListView.builder(
                itemCount: state.launches.length,
                itemBuilder: (context, index) {
                  final launch = state.launches[index];

                  return LoadedLounches(launch: launch);
                },
              ),
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
