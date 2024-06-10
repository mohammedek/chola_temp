import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTheme {
  static ThemeData themeData = ThemeData(
      primaryColor: Colors.pink.shade800,
      hintColor: Colors.grey,
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
      ));
}
