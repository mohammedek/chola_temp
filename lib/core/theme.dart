import 'package:flutter/foundation.dart' show kIsWeb, defaultTargetPlatform;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTheme {
  static ThemeData get themeData {
    Color primaryColor;


    if (kIsWeb) {
      primaryColor = Colors.pink;
    } else if (defaultTargetPlatform == TargetPlatform.iOS ||
        defaultTargetPlatform == TargetPlatform.android) {
      primaryColor = Colors.blue;
    } else {
      primaryColor = Colors.pink.shade100;
    }

    return ThemeData(
      primarySwatch: Colors.pink,
      primaryColor: primaryColor,
      hintColor: Colors.grey,
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
      useMaterial3: true,
    );
  }
}
