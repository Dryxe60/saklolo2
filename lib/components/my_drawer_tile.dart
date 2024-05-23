import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saklolo2/theme/theme_provider.dart';

class MyDrawerTile extends StatelessWidget {
  final String text;
  final IconData? icon;
  final void Function()? onTap;

  const MyDrawerTile({
    Key? key,
    required this.text,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Padding(
      padding: const EdgeInsets.only(left: 25.0),
      child: ListTile(
        title: Text(
          text,
          style: TextStyle(
            color: themeProvider.themeData.colorScheme.onBackground,
          ),
        ),
        leading: Icon(
          icon,
          color: themeProvider.themeData.colorScheme.onBackground,
        ),
        onTap: onTap,
      ),
    );
  }
}

