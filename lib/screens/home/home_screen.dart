import 'package:flutter/material.dart';
import 'package:befine_app/services/session_service.dart';

// Widgets de contenido central (body) por rol
import 'package:befine_app/screens/cliente/widgets/cliente_home_body.dart';
import 'package:befine_app/screens/admin/widgets/admin_home_body.dart';
import 'package:befine_app/screens/dueno/widgets/dueno_home_body.dart';

// Menús laterales personalizados por rol
import 'package:befine_app/screens/cliente/widgets/cliente_drawer.dart';
import 'package:befine_app/screens/admin/widgets/admin_drawer.dart';
import 'package:befine_app/screens/dueno/widgets/dueno_drawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  /// Retorna el Drawer según el rol del usuario.
  Widget? _getDrawerByRole() {
    final role = SessionService.currentUser?.role;

    switch (role) {
      case 'cliente':
        return const ClienteDrawer();
      case 'admin':
        return const AdminDrawer();
      case 'dueno':
        return const DuenoDrawer();
      default:
        return null;
    }
  }

  /// Retorna el contenido principal (body) según el rol del usuario.
  Widget _getBodyByRole() {
    final role = SessionService.currentUser?.role;

    switch (role) {
      case 'cliente':
        return const ClienteHomeBody();
      case 'admin':
        return const AdminHomeBody();
      case 'dueno':
        return const DuenoHomeBody();
      default:
        return const Center(child: Text('Rol no reconocido'));
    }
  }

  @override
  Widget build(BuildContext context) {
    final name = SessionService.currentUser?.name ?? 'Usuario';

    return Scaffold(
      appBar: AppBar(
        title: Text('Bienvenido, $name 💧'),
      ),
      drawer: _getDrawerByRole(),
      body: _getBodyByRole(),
    );
  }
}
