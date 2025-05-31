import 'package:flutter/material.dart';

ThemeData blueMode = ThemeData(
  primarySwatch: Colors.blue,
  scaffoldBackgroundColor: Colors.blueGrey.shade800,
  colorScheme: ColorScheme.dark(
    brightness: Brightness.dark,
    primary: Colors.blue.shade900,
    secondary: Colors.pink.shade300,
    secondaryContainer: Colors.white12,
    tertiary: Colors.black,
    onSurface: Colors.blue.shade50,
    error: Colors.red.shade600,
    onError: Colors.black,
  ),
);