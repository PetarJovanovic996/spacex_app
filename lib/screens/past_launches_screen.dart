import 'package:flutter/material.dart';
import 'package:spacex_app/widgets/latest_launch.dart';

import 'package:spacex_app/widgets/my_app_bar.dart';
import 'package:spacex_app/widgets/my_drawer.dart';
import 'package:spacex_app/widgets/past_launches.dart';

class PastLaunchesScreen extends StatelessWidget {
  const PastLaunchesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: 'Past Launches'),
      drawer: MyDrawer(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: LatestLaunch(),
          ),
          PastLaunches(),
        ],
      ),
    );
  }
}
