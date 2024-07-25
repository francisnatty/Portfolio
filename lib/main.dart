import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/features/app/presentation/pages/home/home_screen.dart';
import 'package:portfolio/features/app/presentation/pages/home/practice.dart';
import 'package:portfolio/features/app/presentation/provider/theme_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (_) => ThemeNotifier(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    return MyStateWidget(
        data: 42,
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: themeNotifier.themeData,

          // localizationsDelegates: const [
          //   // AppLocalizations.delegate,
          //   GlobalMaterialLocalizations.delegate,
          //   GlobalWidgetsLocalizations.delegate,
          //   GlobalCupertinoLocalizations.delegate,
          // ],
          // locale: const Locale('fr'),
          // supportedLocales: const [
          //   Locale('en'),
          //   Locale('fr'),
          // ],
          home: const HomeScreen(),
        ));
  }
}
