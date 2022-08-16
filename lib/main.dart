import 'package:flutter/material.dart';
import 'package:islamy_app/modules/ahadeth/ahadeth_view_screen.dart';
import 'package:islamy_app/modules/quran/quran_view_screen.dart';
import 'package:islamy_app/modules/settings/settings_screen.dart';
import 'package:islamy_app/providers/local_provider.dart';
import 'package:islamy_app/shared/components/styles/styles.dart';
import 'package:provider/provider.dart';
import 'layout/home/home_Screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
void main() {
  runApp(ChangeNotifierProvider(
      create: (_)=>LocaleProvider(),
      child: const MyApp())
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    LocaleProvider provider = Provider.of(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomeScreen.route:(_)=>HomeScreen(),
        QuranViewScreen.route:(_)=>QuranViewScreen(),
        AhadethViewScreen.route:(_)=>AhadethViewScreen(),
        SettingsScreen.route:(_)=>SettingsScreen()
      },
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      darkTheme: AppStyle.darkTheme,
      theme: AppStyle.lightTheme,
      themeMode: provider.mode,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(provider.locale),
      initialRoute: HomeScreen.route,
    );
  }
}
