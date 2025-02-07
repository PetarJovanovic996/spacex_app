import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex_app/core/routes.dart';
import 'package:spacex_app/cubit/single_cubit.dart';
import 'package:spacex_app/models/launch_model.dart';

class LoadedLounches extends StatelessWidget {
  const LoadedLounches({super.key, required this.launch, required this.id});

  final Launch launch;
  final String id;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.read<SingleCubit>().fetchSingleLaunches(id);
        Navigator.of(context).pushNamed(
          Routes.singleLaunchScreen,
        );
      },
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
