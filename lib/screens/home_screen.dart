import 'package:flutter/material.dart';
import 'package:spacex_app/routes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Home Screen'),
            SizedBox(
              width: 10,
            ),
            ElevatedButton(
              onPressed: () =>
                  Navigator.of(context).pushNamed(Routes.singleLaunchScreen),
              child: Text(
                'Next Screen',
              ),
            )
          ],
        ),
      ),
    );
  }
}
