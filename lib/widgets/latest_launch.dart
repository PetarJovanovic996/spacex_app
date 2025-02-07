import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex_app/cubit/past_cubit.dart';
import 'package:spacex_app/widgets/loading_widget.dart';
import 'package:spacex_app/widgets/single_launch_widget.dart';

class LatestLaunch extends StatelessWidget {
  const LatestLaunch({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PastCubit, PastState>(
      builder: (context, state) {
        if (state is PastLaunchLoading) {
          return LoadingWidget();
        }
        if (state is PastAndLatestLoaded) {
          final launch = state.latestLaunch;
          return SingleLaunchWidget(launch: launch);
        } else if (state is PastLaunchError) {
          return Center(child: Text(state.message));
        }
        return Container();
      },
    );
  }
}
