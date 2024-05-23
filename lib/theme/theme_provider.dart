import 'package:flutter/material.dart';
import 'package:saklolo2/theme/theme.dart';

class ThemeProvider with ChangeNotifier {
  ThemeData _themeData = lightTheme;

  ThemeData get themeData => _themeData;

  set themeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  bool get isdarkTheme => _themeData == darkTheme; // Added this getter

  void toggleTheme() {
  if (_themeData == lightTheme) {
    themeData = darkTheme;
  } else {
    themeData = lightTheme;
  }
}
}
