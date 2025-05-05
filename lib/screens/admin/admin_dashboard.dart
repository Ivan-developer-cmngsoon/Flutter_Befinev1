import 'package:flutter/material.dart';
import 'package:befine_app/screens/admin/widgets/admin_drawer.dart';
import 'package:befine_app/screens/admin/widgets/admin_home_body.dart';

/// Pantalla principal del Administrador.
///
/// Integra el Drawer lateral y el contenido del dashboard.
/// Aquí se accede a gestión de productos, pedidos y reportes.
class AdminDashboard extends StatelessWidget {
  const AdminDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Panel del Administrador'),
      ),
      drawer: const AdminDrawer(), // Menú lateral del administrador
      body: const AdminHomeBody(), // Contenido principal (modular)
    );
  }
}
