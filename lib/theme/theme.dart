import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.black12,
    elevation: 0,
    iconTheme: IconThemeData(color: Colors.grey),
    titleTextStyle: TextStyle(color: Colors.grey, fontSize: 20),
  ),
  colorScheme: ColorScheme.light(
    background: const Color.fromARGB(255, 211, 211, 211),
    primary: Colors.grey[900]!,
    secondary: const Color.fromARGB(255, 155, 138, 138)!,
  )
);


ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  appBarTheme: const AppBarTheme(
    backgroundColor: Color.fromARGB(31, 0, 0, 0),
    elevation: 0,
    iconTheme: IconThemeData(color: Colors.grey),
    titleTextStyle: TextStyle(color: Colors.grey, fontSize: 20),
  ),
  colorScheme: ColorScheme.dark(
    background: Color.fromARGB(255, 0, 0, 0),
    primary: const Color.fromARGB(255, 0, 0, 0)!,
    secondary: const Color.fromARGB(255, 0, 0, 0)!,
  )
);