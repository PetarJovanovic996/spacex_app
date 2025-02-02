import 'package:flutter/material.dart';
import 'package:spacex_app/core/routes.dart';
import 'package:spacex_app/models/launch_model.dart';

class LoadedLounches extends StatelessWidget {
  const LoadedLounches({
    super.key,
    required this.launch,
  });

  final Launch launch;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).pushNamed(Routes.singleLaunchScreen),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          title: Text(launch.name),
          subtitle: Column(
            children: [
              Text(launch.id),
              Text(launch.date.toString()),
              Text(launch.success.toString()),
              Text(launch.details),
            ],
          ),
        ),
      ),
    );
  }
}
