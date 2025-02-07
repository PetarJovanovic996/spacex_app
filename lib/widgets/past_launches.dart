import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex_app/cubit/past_cubit.dart';
import 'package:spacex_app/widgets/loading_widget.dart';
import 'package:spacex_app/widgets/single_launch_widget.dart';

class PastLaunches extends StatelessWidget {
  const PastLaunches({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PastCubit, PastState>(
      builder: (context, state) {
        if (state is PastLaunchLoading) {
          return LoadingWidget();
        }
        if (state is PastAndLatestLoaded) {
          return Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 1.0,
                mainAxisSpacing: 10.0,
              ),
              itemCount: state.pastLaunches.length,
              itemBuilder: (context, index) {
                final launch = state.pastLaunches[index];
                return SingleLaunchWidget(launch: launch);
              },
            ),
          );
        } else if (state is PastLaunchError) {
          return Center(child: Text(state.message));
        }
        return Container();
      },
    );
  }
}
