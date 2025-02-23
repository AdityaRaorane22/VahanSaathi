import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';
import 'utils/theme.dart';

void main() {
  runApp(const VahanSaathiApp());
}

class VahanSaathiApp extends StatelessWidget {
  const VahanSaathiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'VahanSaathi',
      theme: appTheme,
      home: const SplashScreen(),
    );
  }
}