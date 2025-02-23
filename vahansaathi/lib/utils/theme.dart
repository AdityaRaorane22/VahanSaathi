import 'package:flutter/material.dart';

final ThemeData appTheme = ThemeData(
  primarySwatch: Colors.green,
  scaffoldBackgroundColor: Colors.green.shade50,
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.green.shade600,
      foregroundColor: Colors.white,
    ),
  ),
);
