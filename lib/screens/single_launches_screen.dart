import 'package:flutter/material.dart';
import 'package:spacex_app/routes.dart';

class SingleLaunchesScreen extends StatelessWidget {
  const SingleLaunchesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Single Launches Screen'),
            SizedBox(
              width: 10,
            ),
            ElevatedButton(
              onPressed: () =>
                  Navigator.of(context).pushNamed(Routes.futureLaunchesScreen),
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
