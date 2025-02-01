import 'package:flutter/material.dart';
import 'package:spacex_app/routes.dart';

void main() {
  runApp(const MyApp());
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
