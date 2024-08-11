import 'package:flutter/material.dart';
import 'package:portfolio/core/constants/colors.dart';
import 'package:portfolio/core/constants/theme/app_styles.dart';

class AppTheme {
  final AppColors colors;
  final String font;
  final AppStyles styles;

  AppTheme({
    required this.colors,
    required this.font,
  }) : styles = AppStyles(color: colors, fontFamily: font);

  ThemeData get themeData => ThemeData(
        useMaterial3: true,
        fontFamily: 'QuietSans',
        primaryColor: colors.primaryColor,
        extensions: [styles, colors],
        textTheme: TextTheme(
          bodySmall: styles.buttonBold30,
          titleSmall: styles.buttonBold30,
        ),
        // colorScheme: ColorScheme(
        //     brightness: Brightness.light,
        //     primary: colors.primaryColor,
      );
}
