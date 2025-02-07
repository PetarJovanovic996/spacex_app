import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex_app/cubit/past_cubit.dart';
import 'package:spacex_app/widgets/loading_widget.dart';

import 'package:spacex_app/widgets/my_app_bar.dart';
import 'package:spacex_app/widgets/my_drawer.dart';
import 'package:spacex_app/widgets/past_launches.dart';
import 'package:spacex_app/widgets/single_launch_widget.dart';

class PastLaunchesScreen extends StatelessWidget {
  const PastLaunchesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: 'Past Launches'),
      drawer: MyDrawer(),
      body: BlocBuilder<PastCubit, PastState>(
        builder: (context, state) {
          if (state is PastLaunchLoading) {
            return const LoadingWidget();
          }

          if (state is PastAndLatestLoaded) {
            return PastLaunchesContent(state: state);
          }

          if (state is PastLaunchError) {
            return Center(child: Text(state.message));
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}

class PastLaunchesContent extends StatelessWidget {
  const PastLaunchesContent({required this.state, super.key});

  final PastAndLatestLoaded state;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SingleLaunchWidget(launch: state.latestLaunch),
        PastLaunchesGrid(pastLaunches: state.pastLaunches),
      ],
    );
  }
}
