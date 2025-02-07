import 'package:flutter/material.dart';
import 'package:spacex_app/core/routes.dart';
import 'package:spacex_app/models/launch_model.dart';

class SingleLaunchWidget extends StatelessWidget {
  const SingleLaunchWidget({required this.launch, super.key});

  final Launch launch;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).pushNamed(
        Routes.singleLaunchScreen,
      ),
      child: Padding(
        padding: const EdgeInsets.all(1.0),
        child: Card(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(launch.name),
                SizedBox(
                  height: 6,
                ),
                Text("ID: ${launch.id}"),
                Text("Date: ${launch.formattedDate}"),
                Text("Success: ${launch.success ? 'Yes' : 'No'}"),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Details: ${launch.details}",
                  style: TextStyle(
                    overflow: TextOverflow.ellipsis,
                  ),
                  maxLines: 3,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
