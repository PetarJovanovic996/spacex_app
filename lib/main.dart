import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex_app/cubit/launch_cubit.dart';
import 'package:spacex_app/routes.dart';
import 'package:spacex_app/services/spacex_service.dart';

void main() {
  runApp(BlocProvider(
    create: (context) => LaunchCubit(SpaceXService()),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //theme: ...,
      debugShowCheckedModeBanner: false,
      title: 'Named Routes',
      onGenerateRoute: MyRouter.onGenerateRoute,
    );
  }
}
