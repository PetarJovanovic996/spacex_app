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
      onTap: () => Navigator.of(context).pushNamed(
        Routes.singleLaunchScreen,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          title: Text(launch.name),
          subtitle: Column(
            children: [
              Text("ID: ${launch.id}"),
              Text("Date: ${launch.formattedDate}"),
              Text("Success: ${launch.success ? 'Yes' : 'No'}"),
              Text("Details: ${launch.details}"),
            ],
          ),
        ),
      ),
    );
  }
}
