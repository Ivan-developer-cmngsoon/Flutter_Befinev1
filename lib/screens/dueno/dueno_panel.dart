import 'package:flutter/material.dart';

/// Panel completo para el dueño.
/// Acceso total: productos, pedidos, usuarios, configuraciones.
class DuenoPanel extends StatelessWidget {
  const DuenoPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Panel del Dueño'),
      ),
      body: const Center(
        child: Text(
          'Panel Dueño\n(Usuarios, Configuración, Reportes avanzados)',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
