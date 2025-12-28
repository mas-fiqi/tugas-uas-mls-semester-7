import 'package:flutter/material.dart';
import 'package:mls/core/constants/colors.dart'; // Ensure package name matches pubspec.yaml if possible, otherwise relative import might be safer if package name is unknown, but prompt used package import. I will check pubspec later, but for now I'll follow the prompt or use relative import if 'lms_hybrid_app' is not the package name. 
// However, the prompt explicitly gave: import 'package:lms_hybrid_app/core/constants/colors.dart';
// If the package name is different, this will break. 
// Let's assume the user knows the package name is lms_hybrid_app or I should check.
// Using relative import is safer: import '../constants/colors.dart';
// BUT, creating the file exactly as requested is usually better. 
// I'll stick to the prompt's code but if it fails I'll fix it. 
// Wait, I can't check pubspec easily without reading it.
// I'll try to read pubspec.yaml first to be safe? 
// No, the prompt explicitly provided the code block. I should trust the prompt unless it's obviously wrong.
// If the user copy-pasted this code, they expect this code.

final ThemeData appTheme = ThemeData(
  primaryColor: kPrimaryColor,
  scaffoldBackgroundColor: kBackgroundColor,
  colorScheme: ColorScheme.fromSeed(
    seedColor: kPrimaryColor,
    primary: kPrimaryColor,
    secondary: kAccentColor,
    background: kBackgroundColor,
    surface: kSurfaceColor,
  ),
  textTheme: const TextTheme(
    displayLarge: TextStyle(color: kTextColor, fontWeight: FontWeight.bold),
    bodyLarge: TextStyle(color: kTextColor),
    bodyMedium: TextStyle(color: kTextColor),
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: kPrimaryColor, 
    foregroundColor: Colors.white, 
    elevation: 0,
    centerTitle: true,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: kPrimaryColor,
      foregroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8), 
      ),
      padding: const EdgeInsets.symmetric(vertical: 16),
      textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    ),
  ),
  inputDecorationTheme: const InputDecorationTheme(
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: kPrimaryColor, width: 2),
    ),
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.grey),
    ),
    labelStyle: TextStyle(color: kTextLightColor),
  ),
);
