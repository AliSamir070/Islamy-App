import 'package:flutter/material.dart';
import 'package:islamy_app/modules/ahadeth/ahadeth_view_screen.dart';
import 'package:islamy_app/modules/quran/quran_view_screen.dart';
import 'layout/home/home_Screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomeScreen.route:(_)=>HomeScreen(),
        QuranViewScreen.route:(_)=>QuranViewScreen(),
        AhadethViewScreen.route:(_)=>AhadethViewScreen()
      },
      initialRoute: HomeScreen.route,
    );
  }
}
