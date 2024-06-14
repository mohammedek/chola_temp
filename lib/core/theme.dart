import 'package:chola_first/constants/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTheme {
  static ThemeData themeData = ThemeData(
    primarySwatch: Colors.pink,
    primaryColor: kprimaryColor,
    hintColor: Colors.grey,
    listTileTheme: const ListTileThemeData(
      tileColor: Colors.white,
    ),
    cardTheme: CardTheme(
        surfaceTintColor: Colors.transparent,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        shadowColor: Colors.transparent),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.black54),
      displayLarge: TextStyle(fontSize: 20, color: Colors.black),
    ),
    brightness: Brightness.light,
    appBarTheme: const AppBarTheme(
      surfaceTintColor: Colors.white,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.grey,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      alignLabelWithHint: true,
      fillColor: Colors.white,
      filled: true,
      isDense: true,
      contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
    ),
    useMaterial3: false,
  );
}

class WebTheme {
  static ThemeData themeData = ThemeData(
    primarySwatch: Colors.pink,
    primaryColor: kprimaryColor,
    hintColor: Colors.grey,
    listTileTheme: const ListTileThemeData(
      tileColor: Colors.white,
    ),
    cardTheme: CardTheme(
      surfaceTintColor: Colors.transparent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      shadowColor: Colors.transparent,
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.black54),
      displayLarge: TextStyle(fontSize: 20, color: Colors.black),
    ),
    brightness: Brightness.light,
    appBarTheme: const AppBarTheme(
      surfaceTintColor: Colors.white,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.grey,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      alignLabelWithHint: true,
      fillColor: Colors.white,
      filled: true,
      isDense: true,
      contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
    ),
    useMaterial3: false,
  );
}
