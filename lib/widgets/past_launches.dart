import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex_app/cubit/past_cubit.dart';
import 'package:spacex_app/widgets/loading_widget.dart';

class PastLaunches extends StatelessWidget {
  const PastLaunches({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PastCubit, PastState>(
      builder: (context, state) {
        if (state is PastLaunchLoading) {
          state is LoadingWidget;
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
                return Padding(
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
                );
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
