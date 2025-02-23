import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';
import 'screens/queue_screen.dart';
import 'screens/login_screen.dart'; // Ensure login exists
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
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/queue': (context) => const QueueScreen(),
        '/login': (context) => const LoginScreen(), // Ensure this exists
      },
    );
  }
}
