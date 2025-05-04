import 'package:flutter/material.dart';
import 'package:befine_app/screens/auth/login_screen.dart';
import 'package:befine_app/theme/app_theme.dart';
import 'package:befine_app/services/cart_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CartService.loadCart(); // Carga los datos guardados del carrito
  runApp(const BefineApp());
}

class BefineApp extends StatelessWidget {
  const BefineApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Agua Purificada Befine',
      theme: AppTheme.lightTheme,
      home: const LoginScreen(),
    );
  }
}
