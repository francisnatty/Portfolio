import 'package:flutter/material.dart';
import 'package:portfolio/core/constants/colors.dart';

ThemeData lightTheme = ThemeData(
    fontFamily: 'QuietSans',
    // extensions: [AppStyles(color: AppColors(), fontFamily: 'QuietSans')],
    brightness: Brightness.light,
    useMaterial3: true,
    textTheme: const TextTheme(
      titleLarge: TextStyle(
          fontSize: 25, fontWeight: FontWeight.w700, color: Colors.black),
      displayLarge: TextStyle(
          fontSize: 32, fontWeight: FontWeight.bold, color: Colors.black),
      bodyLarge: TextStyle(fontSize: 18, color: Colors.white),
      labelMedium: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      ),
      bodySmall: TextStyle(
          fontSize: 18, fontWeight: FontWeight.w500, color: Colors.black),
    ),
    appBarTheme: const AppBarTheme(
      color: Colors.purple,
      iconTheme: IconThemeData(color: Colors.white),
    ),
    // primaryColor: AppColors.purple,
    textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
            textStyle: WidgetStateProperty.all(
      const TextStyle(
          fontWeight: FontWeight.w800, fontSize: 16, fontFamily: 'QuietSans'),
    ))),
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.de.primaryColor),
    iconTheme: IconThemeData(
      color: AppColors.de.primaryColor,
    ));

ThemeData darkTheme = ThemeData(
    fontFamily: 'QuietSans',
    textTheme: const TextTheme(
      displayLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
      bodyLarge: TextStyle(
        fontSize: 18,
        color: Colors.white70,
      ),
    ),
    appBarTheme: const AppBarTheme(
      color: Colors.red,
      iconTheme: IconThemeData(color: Colors.white),
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.red,
      brightness: Brightness.dark,
    ));
