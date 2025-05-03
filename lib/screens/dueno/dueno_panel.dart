import 'package:flutter/material.dart';
import 'widgets/dueno_drawer.dart'; // Importa el Drawer personalizado

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
      drawer: const DuenoDrawer(), // Aquí agregamos el menú lateral
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
