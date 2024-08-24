import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:portfolio/core/constants/theme/custom_theme.dart';
import 'package:portfolio/core/custom_widgets/size_config.dart';
import 'package:portfolio/features/app/presentation/pages/home/home_screen.dart';
import 'package:provider/provider.dart';

import 'core/responsive/screen_info.dart';
import 'features/app/presentation/provider/theme_provider.dart';

late ScreenInfo screenInfo;
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
    screenInfo = ScreenInfo(context);

    return ScreenUtilInit(
      designSize: screenInfo.isPhoneScreen
          ? const Size(360, 690)
          : const Size(1920, 1080),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
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
          home: const HomeScreen(),
        );
      },
    );
  }
}
