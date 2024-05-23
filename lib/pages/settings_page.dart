import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:provider/provider.dart";
import "package:saklolo2/theme/theme_provider.dart";

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Settings",
            style: TextStyle(
                color: themeProvider.themeData.colorScheme.onBackground,
              ),
            ),
            backgroundColor: themeProvider.themeData.colorScheme.background,
            iconTheme: IconThemeData(color: themeProvider.themeData.colorScheme.onBackground),
          ),
          body: Container(
            color: themeProvider.themeData.colorScheme.background,
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: themeProvider.themeData.colorScheme.onBackground,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  margin: const EdgeInsets.only(left: 25, top: 10, right: 25),
                  padding: const EdgeInsets.all(25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Dark Mode
                      Text(
                        "Dark Mode",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: themeProvider.themeData.colorScheme.background,
                        ),
                      ),
                      // Switch
                      CupertinoSwitch(
                        value: themeProvider.isdarkTheme,
                        onChanged: (value) {
                          themeProvider.toggleTheme();
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
