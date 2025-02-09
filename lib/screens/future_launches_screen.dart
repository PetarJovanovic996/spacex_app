import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex_app/cubit/future_cubit.dart';
import 'package:spacex_app/widgets/future_launches_grid.dart';
import 'package:spacex_app/widgets/loading_widget.dart';
import 'package:spacex_app/widgets/my_app_bar.dart';
import 'package:spacex_app/widgets/my_drawer.dart';
import 'package:spacex_app/widgets/single_launch_widget.dart';

class FutureLaunchesScreen extends StatelessWidget {
  const FutureLaunchesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: 'Next and Future Launches'),
      drawer: MyDrawer(),
      body: BlocBuilder<FutureCubit, FutureState>(
        builder: (context, state) {
          if (state is FutureLaunchLoading) {
            return const LoadingWidget();
          }

          if (state is NextLaunchLoaded) {
            return Center(
              child: Column(
                children: [
                  SingleLaunchWidget(launch: state.nextLaunch),
                  SizedBox(
                    height: 10,
                  ),
                  _ToggleButton(title: 'Future Launches'),
                ],
              ),
            );
          }

          if (state is FutureAndNextLaunchLoaded) {
            return Column(
              children: [
                _ToggleButton(title: 'NextLaunch'),
                FutureLaunchesGrid(futureLaunches: state.futureLaunches),
              ],
            );
          }

          if (state is FutureLaunchError) {
            return Center(child: Text(state.message));
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}

class _ToggleButton extends StatelessWidget {
  const _ToggleButton({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white, // Ovdje postavljamo boju teksta (bela)
      ),
      onPressed: () {
        context.read<FutureCubit>().toggleLaunches(); // Prebaci stanje
      },
      child: Text(title, style: TextStyle(color: Colors.black)),
    );
  }
}
