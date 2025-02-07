import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex_app/cubit/launch_cubit.dart';
import 'package:spacex_app/widgets/loading_widget.dart';
import 'package:spacex_app/widgets/my_app_bar.dart';
import 'package:spacex_app/widgets/my_drawer.dart';
import 'package:spacex_app/widgets/single_launch_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: 'All launches'),
      drawer: MyDrawer(),
      body: BlocBuilder<LaunchCubit, LaunchState>(
        builder: (context, state) {
          if (state is LaunchLoading) {
            return LoadingWidget();
          }

          if (state is LaunchLoaded) {
            return RefreshIndicator(
              onRefresh: () async =>
                  context.read<LaunchCubit>().fetchAllLaunches(),
              child: ListView.builder(
                itemCount: state.launches.length,
                itemBuilder: (context, index) =>
                    SingleLaunchWidget(launch: state.launches[index]),
              ),
            );
          }

          if (state is LaunchError) {
            return Center(child: Text(state.message));
          }
          return Container();
        },
      ),
    );
  }
}
