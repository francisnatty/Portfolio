// import 'package:flutter/material.dart';
// import 'package:portfolio/core/themeing/app_theme.dart';

// class AppThemeManager {
//   final AppTheme _lightTheme;
//   final AppTheme? _dartTheme;

//   AppThemeManager({
//     required AppTheme lightTheme,
//     required AppTheme? darkTheme,
//   })  : _lightTheme = lightTheme,
//         _dartTheme = darkTheme;

//   ThemeData? get lightTheme => _lightTheme.themeData;
//   ThemeData? get darkTheme => _dartTheme?.themeData;

//   ThemeMode get themeMode {
//     final mode = _themeMode;
//     if (mode == null) {
//       throw Exception(
//           'Tried accessing themeMode before initialise was called of finished');
//     } else {
//       return mode;
//     }
//   }

//   static ThemeMode? _themeMode;
//   static Future<void> initialise({
//     ThemeMode defaultMode = ThemeMode.system,
//     bool forceDefault = false,
//   }) async {
//     if (forceDefault) {
//       _themeMode = defaultMode;
//     }else{
//       final mode=await _ge
//     }
//   }
//   static Future<ThemeMode> _getLastTheme(ThemeMode defaultMode) async{

//   }
// }
