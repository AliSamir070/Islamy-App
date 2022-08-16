import 'package:flutter/material.dart';

class AppStyle{
  static Color lightbaseColor = Color(0xffB7935F);
  static Color lightaccentColor = Color(0xffF8F8F8);
  static Color darkbaseColor = Color(0xffFACC1D);
  static Color darkaccentColor = Color(0xff141A2E);
  static ThemeData lightTheme = ThemeData(
    canvasColor: lightbaseColor,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: Colors.black,
    ),
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(
        color: Colors.black
      ),
      actionsIconTheme: IconThemeData(
          color: Colors.black
      ),
    ),
    scaffoldBackgroundColor: Colors.transparent,
    primaryColor: lightbaseColor,
    textTheme: TextTheme(
      titleLarge:  TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 30
      ),
      titleMedium: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: lightbaseColor
      ),
      displayMedium: TextStyle(
        fontSize: 30,
        color: Colors.black
    ),
      bodySmall: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 30
      ),
      headlineMedium: TextStyle(
          fontSize: 25,
          fontFamily: 'Cairo',
          fontWeight: FontWeight.w900,
          color: Colors.white
      ),
    ),

  );
  static ThemeData darkTheme = ThemeData(
      canvasColor: darkaccentColor,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: darkbaseColor,
      ),
      appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(
              color: Colors.white
          ),
          actionsIconTheme: IconThemeData(
              color: Colors.white
          ),
      ),
      scaffoldBackgroundColor: Colors.transparent,
      primaryColor: darkbaseColor,
      textTheme: TextTheme(
        titleLarge:  TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 30
        ),
        titleMedium: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: darkbaseColor
        ),
        displayMedium: TextStyle(
            fontSize: 30,
            color: Colors.white
        ),
        bodySmall: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 30
        ),
        headlineMedium:TextStyle(
            fontSize: 25,
            fontFamily: 'Cairo',
            fontWeight: FontWeight.w900,
            color: Colors.black
        ),
      )
  );

}

