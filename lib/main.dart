import 'package:flutter/material.dart';
import 'package:islamy_app/modules/home/home_Screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //Future.delayed(Duration(),(){});
    return MaterialApp(
      routes: {
        HomeScreen.route:(_)=>HomeScreen()
      },
      initialRoute: HomeScreen.route,
    );
  }
}
