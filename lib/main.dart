import 'package:flutter/material.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:portfolio/core/constants/theme/custom_theme.dart';
import 'package:portfolio/core/custom_widgets/size_config.dart';
import 'package:portfolio/features/app/presentation/pages/home/practice.dart';
import 'package:portfolio/features/app/presentation/pages/qualification.dart';
import 'package:provider/provider.dart';

import 'features/app/presentation/provider/theme_provider.dart';

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
    SizeConfig.init(context);
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: lightTheme,
      darkTheme: lightTheme,

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
      home: const Qualification(),
    );
  }
}
