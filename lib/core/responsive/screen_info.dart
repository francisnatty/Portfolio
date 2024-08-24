import 'package:flutter/material.dart';

class ScreenInfo {
  final double screenWidth;

  static ScreenInfo? _instance;

  // Private constructor
  ScreenInfo._internal(BuildContext context)
      : screenWidth = MediaQuery.of(context).size.width;

  // Factory constructor to return the singleton instance
  factory ScreenInfo(BuildContext context) {
    _instance ??= ScreenInfo._internal(context);
    return _instance!;
  }

  bool get isWindowsScreen => screenWidth > 600;
  bool get isPhoneScreen => screenWidth < 600;
}
