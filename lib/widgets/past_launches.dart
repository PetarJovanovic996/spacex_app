import 'package:flutter/material.dart';
import 'package:spacex_app/models/launch_model.dart';
import 'package:spacex_app/widgets/single_launch_widget.dart';

class PastLaunchesGrid extends StatelessWidget {
  const PastLaunchesGrid({
    required this.pastLaunches,
    super.key,
  });

  final List<Launch> pastLaunches;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 1.0,
          mainAxisSpacing: 10.0,
        ),
        itemCount: pastLaunches.length,
        itemBuilder: (context, index) {
          final launch = pastLaunches[index];
          return SingleLaunchWidget(launch: launch);
        },
      ),
    );
  }
}
