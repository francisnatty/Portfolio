import 'package:flutter/material.dart';
import 'package:portfolio/core/constants/colors.dart';

class AppStyles extends ThemeExtension<AppStyles> {
  final AppColors color;
  final String fontFamily;

  static AppStyles of(BuildContext context) {
    final theme = Theme.of(context).extension<AppStyles>();
    if (theme == null) {
      throw Exception('AppStyles has not been added to app theme');
    }
    return theme;
  }

  final TextStyle buttonBold30;

  AppStyles({required this.color, required this.fontFamily})
      : buttonBold30 =
            const TextStyle(fontWeight: FontWeight.w700, fontSize: 25);

  @override
  ThemeExtension<AppStyles> copyWith() {
    // TODO: implement copyWith
    throw UnimplementedError();
  }

  @override
  ThemeExtension<AppStyles> lerp(
      covariant ThemeExtension<AppStyles>? other, double t) {
    // TODO: implement lerp
    throw UnimplementedError();
  }
}
