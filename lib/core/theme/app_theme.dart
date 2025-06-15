import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryColor = Color(0xFFEF4444); // News Red
  static const Color backgroundColor = Color(0xFF0A080F);
  static const Color textPrimary = Color(0xFFF0F0F5);
  static const Color textSecondary = Color(0xFF94A3B8);
  static const Color border = Color(0xFF334155);

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: Colors.white,
      primaryColor: primaryColor,
      colorScheme: const ColorScheme.light(
        primary: primaryColor,
        secondary: Color(0xFFE57373),
        surface: Colors.white,
        onPrimary: Colors.white,
        onSecondary: Colors.black,
        onSurface: Colors.black,
        error: Colors.redAccent,
        onError: Colors.white,
        brightness: Brightness.light,
      ),
      appBarTheme: const AppBarTheme(
        color: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        titleTextStyle: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: backgroundColor,
      primaryColor: primaryColor,
      colorScheme: const ColorScheme.dark(
        primary: primaryColor, // CORRECTED: Was 'primarycolor'
        secondary: Color(0xFFE57373),
        surface: backgroundColor,
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onSurface: textPrimary,
        error: Colors.redAccent,
        onError: Colors.white,
        brightness: Brightness.dark,
      ),
      appBarTheme: const AppBarTheme(
        color: backgroundColor,
        elevation: 0,
        iconTheme: IconThemeData(color: textPrimary),
        titleTextStyle: TextStyle(color: textPrimary, fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }
}
