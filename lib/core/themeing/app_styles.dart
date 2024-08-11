import 'package:flutter/material.dart';
import '../constants/colors.dart';

class AppStyles extends ThemeExtension<AppStyles> {
  final AppColors colors;
  final String headingFontFamily;
  final String bodyFontFamily;

  static const defaultHeadingFont = 'QuietSans';
  static const defaultBodyFont = 'QuietSans';

  static AppStyles of(BuildContext context) {
    final theme = Theme.of(context).extension<AppStyles>();
    if (theme == null) {
      throw Exception('AppStyles has not been added to app theme extensions');
    }
    return theme;
  }

  final TextStyle heading64Bold;

  AppStyles({
    required this.colors,
    required this.headingFontFamily,
    required this.bodyFontFamily,
  }) : heading64Bold = TextStyle(
          fontFamily: headingFontFamily,
          fontWeight: FontWeight.w700,
          fontSize: 64,
          height: 72 / 64,
        );

  @override
  ThemeExtension<AppStyles> copyWith(
      {AppColors? colors, String? headingFontFamily, String? bodyFontFamily}) {
    return AppStyles(
      colors: colors ?? this.colors,
      headingFontFamily: headingFontFamily ?? this.headingFontFamily,
      bodyFontFamily: bodyFontFamily ?? this.bodyFontFamily,
    );
  }

  @override
  ThemeExtension<AppStyles> lerp(
      covariant ThemeExtension<AppStyles>? other, double t) {
    return other ?? this;
  }
}
