import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saklolo2/components/my_drawer_tile.dart';
import 'package:saklolo2/pages/settings_page.dart';
import 'package:saklolo2/theme/theme_provider.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return Drawer(
          backgroundColor: themeProvider.themeData.colorScheme.background,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 100.0),
                child: Icon(
                  Icons.lock_open_rounded,
                  size: 40,
                  color: themeProvider.themeData.colorScheme.inversePrimary,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Divider(
                  color: themeProvider.themeData.colorScheme.background,
                ),
              ),
              MyDrawerTile(
                text: "HOME",
                icon: Icons.home,
                onTap: () => Navigator.pop(context),
              ),
              MyDrawerTile(
                text: "SETTINGS",
                icon: Icons.settings,
                onTap: () {
                  // Define your onTap action here
                  print('Settings tapped');
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SettingsPage(),
                    ),
                  );
                },
              ),
              const Spacer(),
              MyDrawerTile(
                text: "Logout",
                icon: Icons.logout,
                onTap: () {
                  // Define your onTap action here
                  print('logout tapped');
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
