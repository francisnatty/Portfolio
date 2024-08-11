import 'package:flutter/material.dart';

class AppColors extends ThemeExtension<AppColors> {
  final Color primaryColor;
  final Color purple;
  final Color blue;
  final Color black;
  final Color white;
  final Color backgroundColor;

  const AppColors({
    required this.backgroundColor,
    required this.black,
    required this.blue,
    required this.primaryColor,
    required this.purple,
    required this.white,
  });

  // static const purple = Colors.purple;
  // static const blue = Colors.blue;
  // static const black = Colors.black;
  // static const white = Colors.white;
  // static const primaryColor = Color(0xFFAB47BC);
  // static const backgroundColor = Colors.black54;

  static AppColors of(BuildContext context) {
    final theme = Theme.of(context).extension<AppColors>();
    if (theme == null) {
      throw Exception('AppColors has not been added to app theme extensions');
    }
    return theme;
  }

  static const de = AppColors(
    backgroundColor: Colors.black54,
    black: Colors.black,
    blue: Colors.blue,
    primaryColor: Color(0xFFAB47BC),
    purple: Colors.purple,
    white: Colors.white,
  );

  @override
  ThemeExtension<AppColors> copyWith() {
    // TODO: implement copyWith
    throw UnimplementedError();
  }

  @override
  ThemeExtension<AppColors> lerp(
      covariant ThemeExtension<AppColors>? other, double t) {
    // TODO: implement lerp
    throw UnimplementedError();
  }
}
