import 'package:flutter/material.dart';
import 'screens/auth/login_screen.dart'; // Importamos la pantalla de login
import 'theme/app_theme.dart'; // 👈 Importa el tema

void main() {
  runApp(const BefineApp());
}

class BefineApp extends StatelessWidget {
  const BefineApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Agua Purificada Befine',
      theme: AppTheme.lightTheme, // 👈 Aplica el tema
      home: const LoginScreen(), // Pantalla inicial temporal
    );
  }
}
