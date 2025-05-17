import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:befine_app/models/user_model.dart';
import 'package:befine_app/models/product_model.dart'; // ✅ Importar modelo Product
import 'package:befine_app/screens/auth/login_screen.dart';
import 'package:befine_app/theme/app_theme.dart';
import 'package:befine_app/services/cart_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Inicialización de Hive
  await Hive.initFlutter();

  // ✅ Registrar adaptadores
  Hive.registerAdapter(UserAdapter());
  Hive.registerAdapter(ProductAdapter());

  // ✅ Abrir cajas Hive
  final usersBox = await Hive.openBox<User>('usersBox');
  await Hive.openBox<Product>('productsBox'); // Caja para productos

  // 👑 Crear usuario "dueño" si no existe
  final exists = usersBox.values.any((u) => u.email == 'dueno@befine.cl');
  if (!exists) {
    await usersBox.add(User(
      name: 'Iván Dueño',
      email: 'dueno@befine.cl',
      password: 'dueno123',
      role: 'dueno',
    ));
  }

  // Carga del carrito (ya existente)
  await CartService.loadCart();

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