import 'package:flutter/material.dart';
import 'package:spacex_app/models/launch_model.dart';
import 'package:spacex_app/widgets/single_launch_widget.dart';

class FutureLaunchesGrid extends StatelessWidget {
  const FutureLaunchesGrid({
    required this.futureLaunches,
    super.key,
  });

  final List<Launch> futureLaunches;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 1.0,
          mainAxisSpacing: 10.0,
        ),
        itemCount: futureLaunches.length,
        itemBuilder: (context, index) {
          final launch = futureLaunches[index];
          return SingleLaunchWidget(launch: launch);
        },
      ),
    );
  }
}
