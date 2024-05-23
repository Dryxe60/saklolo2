import 'package:flutter/material.dart';
import 'package:saklolo2/pages/appearance_page.dart';
import 'package:saklolo2/pages/community_guidelines_page.dart';
import 'package:saklolo2/pages/info_page.dart';
import 'package:saklolo2/pages/profile_page.dart';
import 'package:saklolo2/pages/settings_page.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Menu"),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text("Info"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => InfoPage()),
              );
            },
          ),
          ListTile(
            title: Text("Settings"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingsPage()),
              );
            },
          ),
          ListTile(
            title: Text("Profile"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfilePage()),
              );
            },
          ),
          ListTile(
            title: Text("Appearance"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AppearancePage()),
              );
            },
          ),
          ListTile(
            title: Text("Community Guidelines"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CommunityGuidelinesPage()),
              );
            },
          ),
          Divider(),
          ListTile(
            title: Text("Log Out"),
            onTap: () {
              // Implement log out functionality
            },
          ),
          ListTile(
            title: Text("Saklolo 6.9"),
            onTap: () {
              // Handle version information
            },
          ),
        ],
      ),
    );
  }
}
