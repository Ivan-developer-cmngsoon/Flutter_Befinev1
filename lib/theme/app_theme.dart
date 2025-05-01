import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: const Color(0xFFF8F8FF), // fondo claro
    primaryColor: const Color(0xFF004D99),
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF004D99),
      primary: const Color(0xFF004D99),
      secondary: const Color(0xFF0077CC),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF004D99),
      foregroundColor: Colors.white,
      centerTitle: true,
      elevation: 0,
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Color(0xFF0077CC), width: 2),
      ),
      labelStyle: const TextStyle(color: Color(0xFF004D99)),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF0077CC),
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    ),
    textTheme: const TextTheme(
      bodyMedium: TextStyle(color: Color(0xFF333C4D)),
    ),
  );
}
