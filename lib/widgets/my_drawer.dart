import 'package:flutter/material.dart';
import 'package:spacex_app/core/my_theme.dart';
import 'package:spacex_app/core/routes.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.grey,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: MyTheme.primaryColor,
            ),
            child: Text(
              'Choose Launches',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            title: const Text('All Launches'),
            onTap: () => Navigator.of(context).pushNamed(Routes.homeScreen),
          ),
          SizedBox(
            height: 10,
          ),
          ListTile(
            title: const Text('Future Launches'),
            onTap: () =>
                Navigator.of(context).pushNamed(Routes.futureLaunchesScreen),
          ),
          SizedBox(
            height: 10,
          ),
          ListTile(
              title: const Text('Past Launches'),
              onTap: () =>
                  Navigator.of(context).pushNamed(Routes.pastLaunchesScreen)),
        ],
      ),
    );
  }
}
