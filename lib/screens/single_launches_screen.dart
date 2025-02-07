import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:spacex_app/cubit/single_cubit.dart';
import 'package:spacex_app/widgets/loading_widget.dart';

import 'package:spacex_app/widgets/my_app_bar.dart';

class SingleLaunchesScreen extends StatelessWidget {
  const SingleLaunchesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: 'Choosen Launch',
      ),
      body: BlocBuilder<SingleCubit, SingleState>(
        builder: (context, state) {
          if (state is SingleLaunchLoading) {
            return LoadingWidget();
          }

          if (state is SingleLaunchLoaded) {
            final launch = state.launch;
            return Padding(
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
            );
          } else if (state is SingleLaunchError) {
            return Center(child: Text(state.message));
          }
          return Container();
        },
      ),
    );
  }
}
