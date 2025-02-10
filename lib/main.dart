import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex_app/app_bloc_observer.dart';
import 'package:spacex_app/core/my_theme.dart';
import 'package:spacex_app/cubit/future_cubit.dart';
import 'package:spacex_app/cubit/launch_cubit.dart';
import 'package:spacex_app/core/routes.dart';
import 'package:spacex_app/cubit/past_cubit.dart';
import 'package:spacex_app/cubit/single_cubit.dart';
import 'package:spacex_app/services/cache_service.dart';
import 'package:spacex_app/services/spacex_service.dart';

void main() {
  Bloc.observer = AppBlocObserver();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LaunchCubit(
            SpaceXService(),
            CacheService(),
          ),
        ),
        BlocProvider(
          create: (context) => SingleCubit(
            SpaceXService(),
          ),
        ),
        BlocProvider(
          create: (context) => PastCubit(
            SpaceXService(),
          ),
        ),
        BlocProvider(
          create: (context) => FutureCubit(
            SpaceXService(),
          ),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: MyTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      title: 'Named Routes',
      onGenerateRoute: MyRouter.onGenerateRoute,
    );
  }
}
