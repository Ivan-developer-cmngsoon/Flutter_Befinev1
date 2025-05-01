import 'package:flutter/material.dart';

/// Panel principal del administrador.
/// Aquí se podrán gestionar productos, pedidos y ver reportes.
class AdminDashboard extends StatelessWidget {
  const AdminDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Panel del Administrador'),
      ),
      body: const Center(
        child: Text(
          'Panel Admin\n(Gestión de productos, pedidos, reportes)',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
