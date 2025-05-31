import 'package:flutter/material.dart';

ThemeData pinkMode = ThemeData(
  primarySwatch: Colors.pink,
  scaffoldBackgroundColor: Colors.pink.shade100,
  colorScheme: ColorScheme.light(
    brightness: Brightness.light,
    primary: Colors.pink,
    secondary: Colors.white,
    secondaryContainer: Colors.blue.shade700,
    tertiary: Colors.pink.shade600,
    onSurface: Colors.black,
    error: Colors.red.shade600,
    onError: Colors.pink.shade50,
  ),
);
