import 'package:flutter/material.dart';
import 'features/auth/login_screen.dart';
import 'core/themes/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SOSEC Truck',
      theme: AppTheme.lightTheme,
      home: const LoginScreen(), // Page de connexion comme page initiale
    );
  }
}