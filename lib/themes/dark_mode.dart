import 'package:flutter/material.dart';

ThemeData darkMode = ThemeData(
  primarySwatch: Colors.grey,
  scaffoldBackgroundColor: Colors.black,
  colorScheme: ColorScheme.dark(
    brightness: Brightness.dark,
    primary: Colors.grey.shade600,
    secondary: Colors.pink.shade200,
    secondaryContainer: Colors.blue.shade400,
    tertiary: Colors.white,
    onSurface: Colors.white70,
    error: Colors.red.shade600,
    onError: Colors.white70,
  ),
);
