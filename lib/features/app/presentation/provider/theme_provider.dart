import 'package:flutter/material.dart';
import 'package:portfolio/core/constants/theme/custom_theme.dart'; // Ensure this file defines lightTheme and darkTheme

class ThemeNotifier extends ChangeNotifier {
  bool _isLightMode = true;
  ThemeData _themeData;

  ThemeNotifier() : _themeData = lightTheme;

  ThemeData get themeData => _themeData;

  bool get isLightMode => _isLightMode;

  void toggleTheme() {
    _isLightMode = !_isLightMode;
    _themeData = _isLightMode ? lightTheme : darkTheme;
    notifyListeners();
  }
}
