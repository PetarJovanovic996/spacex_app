import 'package:flutter/material.dart';
import 'package:spacex_app/screens/future_launches_screen.dart';
import 'package:spacex_app/screens/home_screen.dart';
import 'package:spacex_app/screens/past_launches_screen.dart';
import 'package:spacex_app/screens/single_launches_screen.dart';

class Routes {
  static const String homeScreen = 'home-screen';
  static const String pastLaunchesScreen = 'past-launches-screen';
  static const String futureLaunchesScreen = 'future-launches-screen';
  static const String singleLaunchScreen = 'single-launch-screen';
}

class MyRouter {
  static Route<dynamic>? onGenerateRoute(RouteSettings routeSettings) {
    return MaterialPageRoute(
      builder: (BuildContext context) {
        return switch (routeSettings.name) {
          (Routes.homeScreen) => const HomeScreen(),
          (Routes.pastLaunchesScreen) => const PastLaunchesScreen(),
          (Routes.futureLaunchesScreen) => FutureLaunchesScreen(),
          (Routes.singleLaunchScreen) => SingleLaunchesScreen(),

          // Default route
          _ => const HomeScreen(),
        };
      },
    );
  }
}
