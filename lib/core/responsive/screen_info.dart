import 'package:flutter/material.dart';

class ScreenInfo {
  final double screenWidth;

  static ScreenInfo? _instance;

  ScreenInfo._internal(BuildContext context)
      : screenWidth = MediaQuery.of(context).size.width;

  factory ScreenInfo(BuildContext context) {
    _instance ??= ScreenInfo._internal(context);
    return _instance!;
  }

  bool get isWindowsScreen => screenWidth > 600;
  bool get isPhoneScreen => screenWidth < 600;
}
