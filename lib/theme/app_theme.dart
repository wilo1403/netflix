import 'package:flutter/material.dart';

class AppTheme {
  static const Color primary = Color(0xffFF7360);
  static const Color secondary = Color(0xffFFFFFF);
  static const Color bgPrimary = Color(0xff000000);
  static const Color bgSecondary = Color(0xff242734);

  static final ThemeData darkTheme = ThemeData.dark().copyWith(
    // Color primario
    primaryColor: primary,
    textTheme: const TextTheme(
      bodyText1: TextStyle(
        color: Colors.white,
      ),
      bodyText2: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),

    // AppBar Theme
    appBarTheme: const AppBarTheme(
      elevation: 0,
    ),

    // TextButton Theme
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        primary: primary,
      ),
    ),

    // FloatingActionButtons
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      // backgroundColor: Colors.white,
      elevation: 5,
    ),

    // ElevatedButtons
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        primary: primary,
        shape: const StadiumBorder(),
        elevation: 0,
      ),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      labelStyle: TextStyle(
        color: secondary,
      ),
    ),
    scaffoldBackgroundColor: bgPrimary,
  );
}
